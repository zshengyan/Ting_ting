import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ting/components/FriendColumn.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:ting/model/basic_user_info.dart';
import 'package:ting/service/NetworkManager.dart';
import 'package:ting/service/api_service.dart';
import 'package:ting/service/auth_service.dart';

var visibility = false;

class SearchFriend extends StatefulWidget {
  const SearchFriend({super.key});

  @override
  State<SearchFriend> createState() => _SearchFriendState();
}

class Friend {
  int id;
  String username;
  String nickname;
  String avatar;

  Friend(this.id, this.username, this.nickname, this.avatar);

  factory Friend.fromJson(Map<String, dynamic> json) => Friend(
        json['id'],
        json['username'],
        json['nickname'],
        json['avatar'],
      );
}

class _SearchFriendState extends State<SearchFriend> {
  final formkey = GlobalKey<FormState>();

  final _account = TextEditingController();

  var _searched = false;

  List<Friend> _friendList = [];

  Future<void> _freshList() async {
    var api = ApiService.instance;
    var res = await api.searchFriend(_account.text);
    if (res == null) return;
    setState(() {
      _friendList = res;
      _searched = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF303030),
      resizeToAvoidBottomInset: false,
      body: Column(
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
                  onPressed: _freshList,
                ),
              ),
            ],
          ),
          Visibility(
            visible: _friendList.isEmpty && _searched,
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
          ),
          Expanded(
            child: Visibility(
              visible: _friendList.isNotEmpty,
              child: ListView.builder(
                itemCount: _friendList.length,
                itemBuilder: (ctx, index) {
                  return Container(
                    margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("${baseURL}/assets/avatar/${_friendList[index].avatar}"),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _friendList[index].nickname,
                              style: const TextStyle(fontSize: 25),
                            ),
                            Text(
                              "@${_friendList[index].username}",
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        const Spacer(),
                        ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Request(id: _friendList[index].id);
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(10),
                            ),
                            child: const Icon(Icons.add)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Request extends StatefulWidget {
  int id;

  Request({super.key, required this.id});

  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('好友申请'),
      content: TextField(
        controller: _textController,
        decoration: const InputDecoration(hintText: '申请'),
      ),
      actions: [
        TextButton(
          child: const Text('取消'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        ElevatedButton(
          child: const Text('提交'),
          onPressed: () async {
            String request = _textController.text;
            var api = ApiService.instance;
            if (await api.friendRequest(request, widget.id)) {
              Fluttertoast.showToast(msg: "发送成功");
            }
            if (mounted) {
              Navigator.pop(context);
            }
          },
        ),
      ],
    );
  }
}
