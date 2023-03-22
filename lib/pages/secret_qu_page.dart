import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ting/pages/register_page2.dart';

class SecretquPage extends StatefulWidget {
  final String usr, pwd;

  const SecretquPage({Key? key, required this.usr, required this.pwd})
      : super(key: key);

  @override
  State<SecretquPage> createState() => _SecretquPageState();
}

var _securityQuestion = TextEditingController();
var _securityAnswer = TextEditingController();

class _SecretquPageState extends State<SecretquPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: SingleChildScrollView(
        reverse: true,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.85,
          child: Column(
            children: [
              Container(
                width: 230,
                height: 30,
                margin: const EdgeInsets.fromLTRB(0, 149, 80, 0),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("img/secretqu_title.png"),
                        fit: BoxFit.fill)),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(width: 50),
                  Text(
                    "这将会在找回密码时使用噢！",
                    style: TextStyle(fontSize: 13, color: Color(0xFFFFE57F)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 220, 0),
                width: 35,
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
                        image: AssetImage("img/triangle.png"),
                        fit: BoxFit.fill)),
              ),
              Container(
                width: 380,
                height: 410,
                margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                padding: const EdgeInsets.fromLTRB(24, 25, 30, 0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  color: Colors.white38,
                  border:
                      Border.all(color: const Color(0xFFFFE57F), width: 4.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "问题",
                      style: TextStyle(fontSize: 24, color: Colors.white),
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
                      child: TextField(
                        controller: _securityQuestion,
                        cursorColor: Colors.black54,
                        cursorHeight: 20,
                        decoration: const InputDecoration(
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
                            labelText: "  请输入你的问题",
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
                      "答案",
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
                      child: TextField(
                        controller: _securityAnswer,
                        cursorColor: Colors.black54,
                        cursorHeight: 20,
                        decoration: const InputDecoration(
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
                            labelText: "  请输入你的答案",
                            labelStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                            ),
                            fillColor: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 90,
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
                                  onPressed: () {
                                    if (_securityAnswer == "" ||
                                        _securityQuestion.text == "") {
                                      Fluttertoast.showToast(msg: "不可为空");
                                      return;
                                    }
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return RegisterPage2(
                                        usr: widget.usr,
                                        pwd: widget.pwd,
                                        question: _securityQuestion.text,
                                        ans: _securityAnswer.text,
                                      );
                                    }));
                                  },
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    textStyle: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  child: const Center(child: Text('完成')),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
