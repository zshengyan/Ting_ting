import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ting/secret_qu_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: SingleChildScrollView(
        reverse: true,
        child: SizedBox(
          height: MediaQuery.of(context).size.height*0.95,
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.fromLTRB(16, 124, 0, 0),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "img/loginIcon.png"
                        ),
                        fit: BoxFit.fill
                    )
                ),
              ),
              Container(
                width: 72,
                height: 44,
                margin: const EdgeInsets.fromLTRB(17, 14, 0, 0),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "img/logintitle.png"
                        ),
                        fit: BoxFit.fill
                    )
                ),
              ),
              const SizedBox(height: 14,),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                width: 30,
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
                        image: AssetImage(
                            "img/triangle2.png"
                        ),
                        fit: BoxFit.fill
                    )
                ),
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
                        image: AssetImage(
                            "img/border.png"
                        ),
                        fit: BoxFit.fill
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Welcome!",
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.yellowAccent
                      ),
                    ),
                    const SizedBox(height: 20,),
                    const Text(
                      "设置账号",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      width: 320,
                      height: 52,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                              Radius.circular(30.0)),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                offset: const Offset(1, 1),
                                color: Colors.white.withOpacity(0.6)
                            )
                          ]
                      ),
                      child: const TextField(
                        cursorColor: Colors.black54,
                        cursorHeight: 20,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(30))
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                  color: Colors.white38,
                                )
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelText: "  请输入账号",
                            labelStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                            ),
                            fillColor: Colors.white
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    const Text(
                      "设置密码",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      width: 320,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                              Radius.circular(30.0)),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                offset: const Offset(1, 1),
                                color: Colors.white.withOpacity(0.6)
                            )
                          ]
                      ),
                      child: const TextField(
                        obscureText: true,
                        cursorColor: Colors.black54,
                        cursorHeight: 20,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(30))
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                  color: Colors.white38,
                                )
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelText: "  请输入密码",
                            labelStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                            ),
                            fillColor: Colors.white
                        ),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 100,),
                        Expanded(child: ClipRRect(
                          borderRadius: BorderRadius.circular(21),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFFFE57F)
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return const SecretquPage();
                                    })),
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.fromLTRB(35, 7, 36, 8),
                                  foregroundColor: Colors.black,
                                  textStyle: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                child: const Text('注册'),
                              ),
                            ],
                          ),
                        ),
                        ),
                        const SizedBox(width: 100,),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    RichText(
                      textAlign: TextAlign.end,
                      text: TextSpan(
                          text: "                               ",
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                          children: [
                            TextSpan(
                              text: "已拥有账号？",
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white
                              ),
                              recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                            )
                          ]
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
