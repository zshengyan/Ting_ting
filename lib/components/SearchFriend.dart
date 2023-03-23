import 'package:flutter/material.dart';
import 'package:ting/components/FriendColumn.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:ting/model/basic_user_info.dart';
import 'package:ting/service/NetworkManager.dart';

var visibility = false;

var _account = TextEditingController();
var account = _account.text;

class SearchFriend extends StatefulWidget {
  const SearchFriend({super.key});

  @override
  State<SearchFriend> createState() => _SearchFriendState();
}

class _SearchFriendState extends State<SearchFriend> {
  final formkey = GlobalKey<FormState>();

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
                      //回到主界面
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            const Align(
              alignment: FractionalOffset(212 / 430, 69 / 932),
              child: (Text(
                'Ting',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  color: Color(0xFFD2D2D2),
                  height: 1.2,
                ),
              )),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(78, 55, 0, 0),
                  width: 240,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: TextField(
                    controller: _account,
                    cursorColor: Color(0xFF656565),
                    cursorHeight: 29,
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
                      labelText: "输入对方账号",
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
                  height: 40,
                  width: 40,
                  margin: const EdgeInsets.fromLTRB(10, 56, 0, 0),
                  decoration: const BoxDecoration(
                    color: Color(0xFF303030),
                    image: DecorationImage(
                      image: AssetImage('img/search.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      //找到特定的朋友
                      print(_account.text);
                    },
                  ),
                ),
              ],
            ),
            Visibility(
              visible: visibility,
              child: Container(
                margin: const EdgeInsets.fromLTRB(154, 15, 0, 0),
                child: const Text(
                  '未找到该用户！',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFFF94A4A),
                    letterSpacing: 0.1,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
