import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ting/exception/exception_dispatcher.dart';
import 'package:ting/model/basic_user_info.dart';
import '../pages/login_page.dart';
import '../pages/register_page.dart';
import '../pages/register_page2.dart';
import '../pages/secret_qu_page.dart';

const baseURL = "http://twt.subit.org.cn";

class AuthService {
  static final Dio dio = Dio(BaseOptions(baseUrl: baseURL));

  static Future<bool> register(String usr, String pwd, String nickname,
      String question, String ans) async {
    try {
      var response = (await dio.post("/auth/register", data: {
        "username": usr,
        "password": pwd,
        "nickname": nickname,
        "securityAnswer": ans,
        "securityQuestion": question
      }))
          .data;
      if (response["code"] != 10000) {
        ExceptionDispatcher.dispatcher(response["code"]).alert();
        return false;
      }
      return true;
    } catch (e) {
      Fluttertoast.showToast(msg: "Unknown Error");
      return false;
    }
  }

  static Future<bool> updateImage(XFile file, String token) async {
    try {
      var bytes = await file.readAsBytes();
      var multipartFile = MultipartFile.fromBytes(
        bytes,
        filename: file.name,
      );
      var formData = FormData.fromMap({
        'file': multipartFile,
      });
      var response = (await dio.post('/info/uploadAvatar',
              data: formData,
              options: Options(headers: {
                "Authorization": "Bearer $token",
              })))
          .data;
      if (response["code"] != 10000) {
        ExceptionDispatcher.dispatcher(response["code"]).alert();
        return false;
      }
      return true;
    } catch (e) {
      Fluttertoast.showToast(msg: "Unknown Error $e");
      print(e);
      return false;
    }
  }

  static Future<Map<String, dynamic>?> login(String usr, String pwd) async {
    var response = (await dio.post("/auth/login", data: {
      "username": usr,
      "password": pwd,
    }))
        .data;
    if (response["code"] != 10000) {
      ExceptionDispatcher.dispatcher(response["code"]).alert();
      return null;
    }
    return response["data"];
  }

  static Future<bool> checkLogin() async {
    var pref = await SharedPreferences.getInstance();
    GetStorage().write("id", pref.get("id"));
    GetStorage().write("token", pref.get("token"));
    try {
      await dio.get("/info/1",
          options: Options(headers: {
            "Authorization": "Bearer ${pref.getString("token") ?? ""}",
          }));
      return true;
    } catch (error) {
      return false;
    }
  }

  static Future<String?> getSecurityQuestion(String usr) async {
    var response = (await dio.get("/auth/forgetPassword/$usr")).data;
    if (response["code"] != 10000) {
      ExceptionDispatcher.dispatcher(response["code"]).alert();
      return null;
    }
    return response["data"]["question"];
  }

  static Future<bool> resetPasswordBySecurity(
      String usr, String pwd, String ans) async {
    var response = (await dio.post("/auth/forgetPassword/$usr", data: {
      "answer": ans,
      "newPassword": pwd,
    }))
        .data;
    if (response["code"] != 10000) {
      ExceptionDispatcher.dispatcher(response["code"]).alert();
      return false;
    }
    return true;
  }

  static Future<String> getInfo(String filed, String token) async {
    var response = (await dio.get(
      "/info/$filed",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    ))
        .data;
    print(response);
    return "";
  }
}
