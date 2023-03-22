import 'package:flutter/cupertino.dart';
import 'package:ting/pages/login_page.dart';
import 'package:ting/pages/main_page.dart';

class RegisteredRouter {
  static final Map<String, Widget Function(dynamic args)> routers = {
    "login": (_) => const LoginPage(),
    "home": (_) => const MainPage(),
  };
}
