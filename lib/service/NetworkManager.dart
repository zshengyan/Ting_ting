import 'package:dio/dio.dart';
<<<<<<< Updated upstream
=======
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ting/model/basic_user_info.dart';
>>>>>>> Stashed changes

const String BASEURL = "http://twt.subit.org.cn";

class HTTPConfig {
  static const baseURL = BASEURL;
  static const timeout = 3000;
}

class LYFHttpRequest {
  static final BaseOptions options = BaseOptions(
<<<<<<< Updated upstream
    baseUrl: HTTPConfig.baseURL,
    connectTimeout: const Duration(milliseconds: HTTPConfig.timeout),
  );
=======
      baseUrl: HTTPConfig.baseURL, connectTimeout: const Duration(microseconds: 3000));
>>>>>>> Stashed changes
  static final Dio dio = Dio(options);

  static Future<String?> Requestfriend(String account) async {
    var response = (
        await dio.post("/friends/Add friends", data: {
          "UsernameExistException": account,
    }))
        .data;
    if (response["code"] != 10000) {
      return null;
    } else {
      (await SharedPreferences.getInstance()).setString("username", account);
      userInfo.username = account;
    }
    return response["token"];
  }

<<<<<<< Updated upstream
  static Future<String?> friendlist() async {
    var response = (await dio.get(
      "/friends/getFriendList",
    ))
=======
  static Future<String?> getFriendList() async {
    var response = (await dio.get("/friends/getFriendList",))
>>>>>>> Stashed changes
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
