import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../exception/exception_dispatcher.dart';
import 'auth_service.dart';

class ApiService {
  static final ApiService _singleton = ApiService._internal();

  static final Dio dio = Dio(BaseOptions(baseUrl: baseURL));

  ApiService._internal() {
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      if (!await AuthService.checkLogin()) {
        handler
            .reject(DioError(requestOptions: options, message: "not login in"));
      }
      var pref = await SharedPreferences.getInstance();
      var token = pref.get("token");
      options.headers["Authorization"] = "Bearer $token";
      return handler.next(options);
    }));
  }

  static ApiService get instance => _singleton;

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
}
