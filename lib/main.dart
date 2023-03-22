import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ting/components/PersonalAudio.dart';
import 'package:ting/model/basic_user_info.dart';
import 'package:ting/pages/forget_psw_page.dart';
import 'package:ting/pages/forget_psw_usr_page.dart';
import 'package:ting/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ting/pages/main_page.dart';
import 'package:ting/service/auth_service.dart';

void main() {
  runApp(const MyApp());
}

var login = false;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUserInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox(
              width: 0,
              height: 0,
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            print("getUserInfo Done");
            return GetMaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const ForgetpawUsrPage(),
              // home: (!login) ? const LoginPage() : const MainPage(),
            );
          }
          return const SizedBox(
            width: 0,
            height: 0,
          );
        });

    //   GetMaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: const  LoginPage(),
    // );
  }
}

Future<void> getUserInfo() async {
  login = await AuthService.checkLogin();
}
