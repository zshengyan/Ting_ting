import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ting/pages/forget_psw_page.dart';
import 'package:ting/pages/forget_psw_usr_page.dart';
import 'package:ting/pages/main_page.dart';
import 'package:ting/pages/register_page.dart';
import 'package:get/get.dart';
import 'package:ting/service/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

var _username = TextEditingController();
var user = _username.text;
var _password = TextEditingController();
var pass = _password.text;

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: SingleChildScrollView(
        reverse: true,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.95,
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.fromLTRB(16, 84, 0, 0),
                decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("img/loginIcon.png"), fit: BoxFit.fill)),
              ),
              Container(
                width: 72,
                height: 44,
                margin: const EdgeInsets.fromLTRB(17, 14, 0, 0),
                decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("img/logintitle.png"), fit: BoxFit.fill)),
              ),
              const SizedBox(
                height: 14,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                width: 27,
                height: 20,
                decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.white38, width: 13, style: BorderStyle.solid),
                      right: BorderSide(color: Colors.transparent, width: 10, style: BorderStyle.solid),
                      left: BorderSide(color: Colors.transparent, width: 10, style: BorderStyle.solid),
                    ),
                    image: DecorationImage(image: AssetImage("img/triangle2.png"), fit: BoxFit.fill)),
              ),
              Container(
                width: 380,
                height: 468,
                margin: const EdgeInsets.fromLTRB(22, 0, 20, 0),
                padding: const EdgeInsets.fromLTRB(24, 25, 30, 0),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Colors.white38,
                    image: DecorationImage(image: AssetImage("img/border.png"), fit: BoxFit.fill)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hello!",
                      style: TextStyle(fontSize: 35, color: Colors.yellowAccent),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        AuthService.getInfo("nickname",
                            "eyJhbGciOiJIUzUxMiJ9.eyJuaWNrbmFtZSI6IjEyMyIsInBlcm1pc3Npb24iOjEsImlkIjoxLCJ1c2VybmFtZSI6InN0ZXZlbiIsImV4cCI6MTY3NjIxMjE2NX0.xXewAQv1o0cWIXmWOv8twMhuNWS22js7jXRohvLJbsvoU9Pk-B_thI9-SUDZoUdIhJupa3L5ZkjudO3q3D0G7A");
                        // var result = await AuthService.getForgetQuestion(1);
                        // print(result);
                      },
                      child: const Text(
                        "账号",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 320,
                      height: 52,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                          boxShadow: [
                            BoxShadow(blurRadius: 10, offset: const Offset(1, 1), color: Colors.white.withOpacity(0.6))
                          ]),
                      child: TextField(
                        controller: _username,
                        cursorColor: Colors.black54,
                        cursorHeight: 20,
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.all(Radius.circular(30))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                  color: Colors.white38,
                                )),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelText: "  请输入账号",
                            labelStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                            ),
                            fillColor: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "密码",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 320,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                          boxShadow: [
                            BoxShadow(blurRadius: 10, offset: const Offset(1, 1), color: Colors.white.withOpacity(0.6))
                          ]),
                      child: TextField(
                        controller: _password,
                        obscureText: true,
                        cursorColor: Colors.black54,
                        cursorHeight: 20,
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.all(Radius.circular(30))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                  color: Colors.white38,
                                )),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelText: "  请输入密码",
                            labelStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                            ),
                            fillColor: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Get.to(() => const ForgetpawUsrPage()),
                          child: const Text(
                            "<忘记密码？",
                            style: const TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        GestureDetector(
                          onTap: () => Get.to(() => const RegisterPage()),
                          child: const Text(
                            "注册>",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(21),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Container(
                                    decoration: const BoxDecoration(color: Color(0xFFFFE57F)),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    if (_username.text == "" || _password.text == "") {
                                      Fluttertoast.showToast(msg: "用户名或密码不可为空");
                                      return;
                                    }
                                    var res = await AuthService.login(_username.text, _password.text);
                                    if (res == null) return;
                                    _username.text = _password.text = "";
                                    print(res);
                                    var prefs = await SharedPreferences.getInstance();
                                    await prefs.setString("token", res["token"]);
                                    await prefs.setInt("id", res["id"]);
                                    await prefs.setString("username", res["username"]);
                                    await prefs.setString("nickname", res["nickname"]);
                                    if (mounted) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => const MainPage(),
                                        ),
                                      );
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.fromLTRB(35, 7, 36, 8),
                                    foregroundColor: Colors.black,
                                    textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  child: const Center(child: Text('确定')),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
