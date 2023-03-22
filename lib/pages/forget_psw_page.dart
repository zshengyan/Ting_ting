import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ting/pages/login_page.dart';
import 'package:ting/service/auth_service.dart';

class ForgetpawPage extends StatefulWidget {
  final String? question;
  final String user;

  const ForgetpawPage({Key? key, required this.user, this.question})
      : super(key: key);

  @override
  State<ForgetpawPage> createState() => _ForgetpawPageState();
}

class _ForgetpawPageState extends State<ForgetpawPage> {
  final TextEditingController _ans = TextEditingController();
  final TextEditingController _pwd = TextEditingController();

  @override
  void dispose() {
    // 释放控制器资源
    _ans.dispose();
    _pwd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white10,
      body: SingleChildScrollView(
        reverse: true,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.95,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(
                    width: 32,
                  ),
                  Text(
                    "你的密保问题是：",
                    style: TextStyle(
                        fontSize: 22,
                        color: Color(0xFFFFE57F),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Container(
                  width: 267,
                  height: 50,
                  margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Color(0xFFFFE57F), width: 2.5)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.question ?? "ERROR",
                        style: const TextStyle(
                            fontSize: 37,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
              const SizedBox(
                height: 19,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(
                    width: 45,
                  ),
                  Text(
                    "答案",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 320,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          offset: const Offset(1, 1),
                          color: Colors.white.withOpacity(0.8))
                    ]),
                child: TextField(
                  cursorColor: Colors.black54,
                  cursorHeight: 20,
                  controller: _ans,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                            color: Colors.white38,
                          )),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: "  请输入答案",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                      fillColor: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 320,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          offset: const Offset(1, 1),
                          color: Colors.white.withOpacity(0.8))
                    ]),
                child: TextField(
                  cursorColor: Colors.black54,
                  cursorHeight: 20,
                  controller: _pwd,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                            color: Colors.white38,
                          )),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: "  请输入新密码",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                      fillColor: Colors.white),
                ),
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 80,
                        ),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Color(0xFFFFE57F)),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    if (_pwd.text == "" || _ans.text == "") {
                                      Fluttertoast.showToast(msg: "不可为空");
                                      return;
                                    }
                                    var res = await AuthService
                                        .resetPasswordBySecurity(
                                            widget.user, _pwd.text, _ans.text);
                                    if (!res) return;
                                    Fluttertoast.showToast(msg: "重置成功");
                                    if (!mounted) return;
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, "login", (route) => false);
                                  },
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    textStyle: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 6),
                                  ),
                                  child: const Center(child: Text('确定')),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 80,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
