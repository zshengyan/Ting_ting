import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ting/model/basic_user_info.dart';

class AuthService {
  static const baseURL = "http://twt.subit.org.cn";

  static final Dio dio = Dio(BaseOptions(baseUrl: baseURL));

  static Future<String?> login(String user, String pass) async {
    var response = (await dio.post("/auth/login", data: {
      "username": user,
      "password": pass,
    }))
        .data;
    if (response["code"] != 10000) {
      return null;
    }
    response = response["data"];
    return response["token"];
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
