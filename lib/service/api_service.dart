import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ting/pages/listen_friends_page.dart';

import '../components/PersonalAudio.dart';
import '../components/SearchFriend.dart';
import '../exception/exception_dispatcher.dart';
import 'auth_service.dart';

class ApiService {
  static final ApiService _singleton = ApiService._internal();

  static final Dio dio = Dio(BaseOptions(baseUrl: baseURL));

  ApiService._internal() {
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
      if (!await AuthService.checkLogin()) {
        handler.reject(DioError(requestOptions: options, message: "not login in"));
      }
      var pref = await SharedPreferences.getInstance();
      var token = pref.get("token");
      options.headers["Authorization"] = "Bearer $token";
      return handler.next(options);
    }));
  }

  static ApiService get instance => _singleton;

  Future<bool?> setNickname(String nickname) async {
    try {
      var response = (await dio.post("/info/nickname/$nickname")).data;
      print(response);
      if (response["code"] != 10000) {
        ExceptionDispatcher.dispatcher(response["code"]).alert();
        return null;
      }
      return true;
    } catch (e) {
      return null;
    }
  }

  Future<bool> sendFile(String path, String desc) async {
    try {
      var formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(path),
        "title": "default",
        "desc": desc,
        "disabled_list": "-1",
      });
      var response = (await dio.post("/message/send", data: formData)).data;
      print(path);
      print(response);
      if (response["code"] != 10000) {
        ExceptionDispatcher.dispatcher(response["code"]).alert();
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<Friend>?> getFriendRequest() async {
    try {
      var response = (await dio.get("/friend/request")).data;
      if (response["code"] != 10000) {
        ExceptionDispatcher.dispatcher(response["code"]).alert();
        return null;
      }
      return (response["data"] as List<dynamic>).map((e) => Friend.fromJson(e)).toList();
    } catch (e) {
      return null;
    }
  }

  Future<List<Friend>?> getFriendList() async {
    try {
      var response = (await dio.get("/friend/list")).data;
      if (response["code"] != 10000) {
        ExceptionDispatcher.dispatcher(response["code"]).alert();
        return null;
      }
      return (response["data"] as List<dynamic>).map((e) => Friend.fromJson(e)).toList();
    } catch (e) {
      return null;
    }
  }

  Future<String?> getNickName() async {
    try {
      var response = (await dio.get("/info/nickname/update")).data;
      if (response["code"] != 10000) {
        ExceptionDispatcher.dispatcher(response["code"]).alert();
        return null;
      }
      return response["data"];
    } catch (e) {
      return null;
    }
  }

  Future<String?> getUserInfo(String filed) async {
    try {
      var response = (await dio.get("/info/$filed")).data;
      if (response["code"] != 10000) {
        ExceptionDispatcher.dispatcher(response["code"]).alert();
        return null;
      }
      return response["data"];
    } catch (e) {
      return null;
    }
  }

  Future<String?> getAvatarPath() async {
    try {
      var response = (await dio.get("/info/avatar")).data;
      if (response["code"] != 10000) {
        ExceptionDispatcher.dispatcher(response["code"]).alert();
        return null;
      }
      return response["data"];
    } catch (e) {
      return null;
    }
  }

  Future<List<Message>?> getList(int page) async {
    try {
      var response = (await dio.get("/message/list?page=$page")).data;
      if (response["code"] != 10000) {
        ExceptionDispatcher.dispatcher(response["code"]).alert();
        return null;
      }
      return (response["data"] as List<dynamic>).map((e) => Message.fromJson(e)).toList();
    } catch (e) {
      return null;
    }
  }

  Future<bool?> updateLike(String id) async {
    print("/message/updateLike?id=$id");
    try {
      var response = (await dio.get("/message/updateLike?id=$id")).data;
      if (response["code"] != 10000) {
        ExceptionDispatcher.dispatcher(response["code"]).alert();
        return null;
      }
      return true;
    } catch (e) {
      return null;
    }
  }

  Future<bool?> getLikeStatus(String id) async {
    try {
      var response = (await dio.get("/message/getLikeStatus?id=$id")).data;
      if (response["code"] != 10000) {
        ExceptionDispatcher.dispatcher(response["code"]).alert();
        return null;
      }
      return response["data"]["status"];
    } catch (e) {
      return null;
    }
  }

  Future<List<Friend>?> getLikes(String id) async {
    try {
      var response = (await dio.get("/message/getLikeList?id=$id")).data;
      if (response["code"] != 10000) {
        ExceptionDispatcher.dispatcher(response["code"]).alert();
        return null;
      }
      print(response["data"]);
      return (response["data"] as List<dynamic>).map((e) => Friend.fromJson(e)).toList();
    } catch (e) {
      return null;
    }
  }

  Future<List<Friend>?> searchFriend(String key) async {
    try {
      var response = (await dio.get("/friend/search?q=$key")).data;
      if (response["code"] != 10000) {
        ExceptionDispatcher.dispatcher(response["code"]).alert();
        return null;
      }
      return (response["data"] as List<dynamic>).map((e) => Friend.fromJson(e)).toList();
    } catch (e) {
      return null;
    }
  }

  Future<bool> friendRequest(String req, int id) async {
    try {
      var response = (await dio.post("/friend/requestFriend", data: {
        "to": id,
        "desc": req,
      }))
          .data;
      if (response["code"] != 10000) {
        ExceptionDispatcher.dispatcher(response["code"]).alert();
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> acceptRequest(int id) async {
    try {
      var response = (await dio.post("/friend/acceptRequest", data: {
        "id": id,
      }))
          .data;
      if (response["code"] != 10000) {
        ExceptionDispatcher.dispatcher(response["code"]).alert();
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<Msg>?> mineVoice() async {
    try {
      var response = (await dio.get("/message/mine")).data;
      if (response["code"] != 10000) {
        ExceptionDispatcher.dispatcher(response["code"]).alert();
        return null;
      }
      return (response["data"] as List<dynamic>).map((e) => Msg.fromJson(e)).toList();
    } catch (e) {
      return null;
    }
  }

  Future<bool> deleteMessage(String id) async {
    try {
      var response = (await dio.post("/message/delete", data: {"id": id})).data;
      if (response["code"] != 10000) {
        ExceptionDispatcher.dispatcher(response["code"]).alert();
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteFriend(int id) async {
    try {
      var response = (await dio.post("/friend/remove", data: {"id": id})).data;
      if (response["code"] != 10000) {
        ExceptionDispatcher.dispatcher(response["code"]).alert();
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
