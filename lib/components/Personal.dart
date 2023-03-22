import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ting/components/ChangeNickname.dart';
import 'package:ting/components/Collection.dart';
import 'package:ting/components/PersonalAudio.dart';
import 'package:dio/dio.dart';
import 'package:ting/service/api_service.dart';

class Personal extends StatefulWidget {
  const Personal({super.key});

  @override
  State<Personal> createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  Dio dio = Dio();

  void _getData() async {
    var url = "www.baidu.com";
    Response result = await Dio().get(url);
    print(result.data);
  }

  String _nickname = "";

  @override
  void initState() {
    super.initState();
    _initNickname();
  }

  void _initNickname() async {
    var api = ApiService.instance;
    var nickname = await api.getUserInfo("nickname");
    if (nickname == null) return;
    setState(() {
      _nickname = nickname;
    });
  }

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
            Container(
              height: 69,
            ), //纯纯的占位符
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
            Stack(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  margin: const EdgeInsets.fromLTRB(130, 33, 0, 0),
                  child: OutlinedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                    onPressed: () {
                      //按下查看自己的头像
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(75),
                        color: const Color(0xFFD2D2D2),
                      ),
                      height: 150,
                      width: 150,
                      child: const Image(
                        image: AssetImage('img/user.png'),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 45,
                  height: 45,
                  margin: const EdgeInsets.fromLTRB(235, 165, 0, 0),
                  child: OutlinedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                    onPressed: () {
                      //按下拍摄新头像
                      _getData();
                    },
                    child: const SizedBox(
                      height: 150,
                      width: 150,
                      child: Image(
                        image: AssetImage('img/camera2.png'),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: 328,
              height: 45,
              margin: const EdgeInsets.fromLTRB(79, 52, 0, 0),
              child: Row(
                children: [
                  const SizedBox(
                    width: 28,
                    height: 32,
                    child: Image(
                      image: AssetImage('img/pen.png'),
                    ),
                  ),
                  Container(
                    width: 205,
                    height: 45,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Text(
                      _nickname,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: Color(0xFF303030),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: OutlinedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                      onPressed: () {
                        //按下修改昵称
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChangeNickname()));
                      },
                      child: const Image(
                        image: AssetImage('img/arrowright.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 290,
              height: 54,
              margin: const EdgeInsets.fromLTRB(70, 47, 0, 0),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFFFEE8A),
                    width: 1.2,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: OutlinedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                  onPressed: () {
                    //进入我的收藏界面
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Collection()));
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 39,
                        height: 36,
                        margin: const EdgeInsets.fromLTRB(47, 0, 0, 0),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('img/star.png'))),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: const Text(
                          '我的收藏',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                              color: Color(0xFFFFEE8A)),
                        ),
                      )
                    ],
                  )),
            ),
            Container(
              width: 290,
              height: 54,
              margin: const EdgeInsets.fromLTRB(70, 19, 0, 0),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFFFEE8A),
                    width: 1.2,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: OutlinedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                  onPressed: () {
                    //进入我的语音界面
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PersonalAudio()));
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 39,
                        height: 36,
                        margin: const EdgeInsets.fromLTRB(47, 0, 0, 0),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('img/voice.png'))),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: const Text(
                          '我的语音',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                              color: Color(0xFFFFEE8A)),
                        ),
                      )
                    ],
                  )),
            ),
            Container(
              width: 290,
              height: 54,
              margin: const EdgeInsets.fromLTRB(70, 173, 0, 0),
              child: OutlinedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                  onPressed: () {
                    //退出登录，返回登录界面
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 39,
                        height: 36,
                        margin: const EdgeInsets.fromLTRB(47, 0, 0, 0),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('img/quit.png'))),
                      ),
                      GestureDetector(
                        onTap: () async {
                          var prefs = await SharedPreferences.getInstance();
                          await prefs.remove("token");
                          if (mounted) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, "login", (route) => false);
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(11, 0, 0, 0),
                          child: const Text(
                            '退出登录',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                                color: Color(0xFFFFEE8A)),
                          ),
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
