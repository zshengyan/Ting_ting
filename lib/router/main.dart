import 'package:flutter/cupertino.dart';
import 'package:ting/pages/login_page.dart';

class Router {
  static final Map<String, Widget Function(dynamic args)> routers = {
    "loginPage": (_) => const LoginPage()
  };
}
