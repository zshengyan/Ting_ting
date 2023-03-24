import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ting/components/Personal.dart';
import 'package:ting/service/api_service.dart';

class ChangeNickname extends StatefulWidget {
  const ChangeNickname({super.key});

  @override
  State<ChangeNickname> createState() => _ChangeNicknameState();
}

class _ChangeNicknameState extends State<ChangeNickname> {
  final TextEditingController _ctr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF303030),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  margin: const EdgeInsets.fromLTRB(28, 28, 0, 0),
                  decoration: const BoxDecoration(
                    color: Color(0xFF303030),
                    image: DecorationImage(
                      image: AssetImage('img/arrowleft.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      //回到个人界面Personal
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(70, 220, 0, 0),
              child: (const Text(
                '修改昵称',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.normal,
                  color: Color(0xFFFFFFFF),
                  height: 1.2,
                ),
              )),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(70, 16, 0, 0),
              width: 290,
              height: 50,
              decoration: const BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: TextField(
                cursorColor: Color(0xFF656565),
                controller: _ctr,
                cursorHeight: 29,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), borderRadius: BorderRadius.all(Radius.circular(30))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Colors.white38,
                      )),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: "新名字",
                  labelStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Colors.black54,
                  ),
                  fillColor: Colors.white,
                ),
              ),
            ),
            Container(
              height: 74,
              width: 150,
              margin: const EdgeInsets.fromLTRB(140, 120, 0, 0),
              decoration: BoxDecoration(color: const Color(0xFFFFEE8A), borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                child: const Text(
                  '保存',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF303030),
                    letterSpacing: 6,
                  ),
                ),
                onPressed: () async {
                  if (_ctr.text == "") {
                    Fluttertoast.showToast(msg: "不可为空");
                  }
                  var api = ApiService.instance;
                  if (await api.setNickname(_ctr.text) ?? false) {
                    Fluttertoast.showToast(msg: "修改完成");
                    Navigator.pop(context);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
