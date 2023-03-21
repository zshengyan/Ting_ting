import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ting/model/basic_user_info.dart';
import 'package:ting/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ting/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

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
              home: const MainPage(),
              // home: (userInfo.username == '') ? const  LoginPage() : const MainPage(),
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
  userInfo.username =
      (await SharedPreferences.getInstance()).getString("username") ?? '';
  userInfo.nickname =
      (await SharedPreferences.getInstance()).getString("nickname") ?? '';
}
