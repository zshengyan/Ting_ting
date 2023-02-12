import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ting/pages/forget_psw_page.dart';
import 'package:ting/pages/main_page.dart';
import 'package:ting/pages/register_page.dart';
import 'package:get/get.dart';
import 'package:ting/service/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

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
                margin: const EdgeInsets.fromLTRB(16, 124, 0, 0),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("img/loginIcon.png"),
                        fit: BoxFit.fill)),
              ),
              Container(
                width: 72,
                height: 44,
                margin: const EdgeInsets.fromLTRB(17, 14, 0, 0),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("img/logintitle.png"),
                        fit: BoxFit.fill)),
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
                      bottom: BorderSide(
                          color: Colors.white38,
                          width: 13,
                          style: BorderStyle.solid),
                      right: BorderSide(
                          color: Colors.transparent,
                          width: 10,
                          style: BorderStyle.solid),
                      left: BorderSide(
                          color: Colors.transparent,
                          width: 10,
                          style: BorderStyle.solid),
                    ),
                    image: DecorationImage(
                        image: AssetImage("img/triangle2.png"),
                        fit: BoxFit.fill)),
              ),
              Container(
                width: 380,
                height: 468,
                margin: const EdgeInsets.fromLTRB(22, 0, 20, 0),
                padding: const EdgeInsets.fromLTRB(24, 25, 30, 0),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Colors.white38,
                    image: DecorationImage(
                        image: AssetImage("img/border.png"), fit: BoxFit.fill)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hello!",
                      style:
                          TextStyle(fontSize: 35, color: Colors.yellowAccent),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        AuthService.login("steven", "123456");
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30.0)),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                offset: const Offset(1, 1),
                                color: Colors.white.withOpacity(0.6))
                          ]),
                      child: const TextField(
                        cursorColor: Colors.black54,
                        cursorHeight: 20,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30.0)),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                offset: const Offset(1, 1),
                                color: Colors.white.withOpacity(0.6))
                          ]),
                      child: const TextField(
                        obscureText: true,
                        cursorColor: Colors.black54,
                        cursorHeight: 20,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
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
                    RichText(
                      text: TextSpan(
                          text: "<忘记密码？",
                          style: const TextStyle(
                              fontSize: 15, color: Colors.white),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.to(() => const ForgetpawPage()),
                          children: [
                            const TextSpan(
                              text: "                                    ",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            TextSpan(
                                text: "注册>",
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.white),
                                recognizer: TapGestureRecognizer()
                                  ..onTap =
                                      () => Get.to(() => const RegisterPage()))
                          ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 100,
                        ),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(21),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Color(0xFFFFE57F)),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const MainPage();
                                  })),
                                  style: TextButton.styleFrom(
                                    padding:
                                        const EdgeInsets.fromLTRB(35, 7, 36, 8),
                                    foregroundColor: Colors.black,
                                    textStyle: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  child: const Text('确定'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 100,
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
