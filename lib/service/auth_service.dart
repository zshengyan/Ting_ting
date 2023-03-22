import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ting/exception/exception_dispatcher.dart';
import 'package:ting/model/basic_user_info.dart';
import '../pages/login_page.dart';
import '../pages/register_page.dart';
import '../pages/register_page2.dart';
import '../pages/secret_qu_page.dart';

class AuthService {
  static const baseURL = "http://twt.subit.org.cn";

  static final Dio dio = Dio(BaseOptions(baseUrl: baseURL));

  static Future register() async {
    var response = (await dio.post("/auth/register", data: {
      "username": newUser,
      "password": newPass,
      "nickname": nickName,
      "securityQuestion": securityQuestion,
      "securityAnswer": securityAnswer,
    }))
        .data;
    print(response.toString());
    if (response["code"] == 10000) {
      print(response["code"]);
      // (await SharedPreferences.getInstance()).setString("username", newUser);
      // userInfo.newUser = newUser;
      // (await SharedPreferences.getInstance()).setString("nickname", nickName);
      // userInfo.nickname = nickName;
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

  static Future<String> getForgetQuestion(int id) async {
    var response = (await dio.get("/auth/forgetPassword/$id")).data;
    if (response["code"] != 10000) {
      //TODO: 报错处理
    }
    return response["data"]["question"];
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
