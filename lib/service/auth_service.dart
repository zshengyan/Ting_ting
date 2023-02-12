import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ting/model/basic_user_info.dart';


class AuthService {
  static final Dio dio = Dio(BaseOptions(baseUrl: "http://twt.subit.org.cn"));

  static Future<BasicUserInfo?> login(String username, String password) async {
    var raw = (await dio.post("/auth/login", data: {
      username: username,
      password: password,
    }));
    BasicUserInfo data = BasicUserInfo.fromJSON(raw.data["data"]);
    print(data);
    return null;
  }
}
