import 'package:dio/dio.dart';

const String BASEURL = "http://twt.subit.org.cn";

class HTTPConfig {
  static const baseURL = BASEURL;
  static const timeout = 3000;
}

class LYFHttpRequest {
  static final BaseOptions options = BaseOptions(
    baseUrl: HTTPConfig.baseURL,
    connectTimeout: const Duration(milliseconds: HTTPConfig.timeout),
  );
  static final Dio dio = Dio(options);

  static Future<String?> Findfriend(String account) async {
    var response = (await dio.post("/friends/Add friends", data: {
      "user_id": account,
    }))
        .data;
    if (response["code"] != 10000) {
      return null;
    }
    response = response["data"];
    return response["token"];
  }

  static Future<String?> friendlist() async {
    var response = (await dio.get(
      "/friends/getFriendList",
    ))
        .data;
    if (response["code"] != 10000) {
      return null;
    }
    response = response["data"];
    return response["token"];

    print(response);
  }

  static Future<String> getForgetQuestion(int id) async {
    var response = (await dio.get("/auth/forgetPassword/$id")).data;
    if (response["code"] != 10000) {
      //TODO: 报错处理
    }
    return response["data"]["question"];
  }
}
