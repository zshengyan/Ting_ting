import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ting/components/PersonalAudio.dart';
import 'package:ting/components/SearchFriend.dart';
import 'package:ting/pages/login_page.dart';
import 'package:ting/pages/main_page.dart';
import 'package:ting/pages/register_page.dart';
import 'package:ting/pages/register_page2.dart';
import 'package:ting/pages/send_page.dart';
import 'package:ting/router/router.dart';
import 'package:ting/service/auth_service.dart';

void main() async {
  await GetStorage.init();
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
            return const MaterialApp(
                home: Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                child: Text(
                  "Loading",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ));
          } else if (snapshot.connectionState == ConnectionState.done) {
            return GetMaterialApp(
              routes: RegisteredRouter.routers,
              title: 'TingTing',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              // home: const PersonalAudio(),
              home: (!login) ? const LoginPage() : const MainPage(),
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
