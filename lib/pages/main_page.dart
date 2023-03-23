import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ting/components/Personal.dart';
import 'package:ting/pages/listen_friends_page.dart';
import 'package:ting/permission/handler.dart';
import 'package:ting/service/auth_service.dart';
import '../components/FriendColumn.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final String? nickname;
  late final String? avatar;

  var maxLength = 10000;

  void _checkLogin() async {
    if (!await AuthService.checkLogin()) {
      Navigator.pushNamedAndRemoveUntil(context, "login", (route) => false);
    }
  }

  final FlutterSoundRecorder _rec = FlutterSoundRecorder();

  StreamSubscription? _recSub;

  double _time = 0;

  bool isRecord = false;
  bool haveRecord = false;

  @override
  Widget build(BuildContext context) {
    _checkLogin();
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white10,
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                padding: const EdgeInsets.fromLTRB(28, 40, 0, 0),
                icon: const Image(image: AssetImage("img/friendsIcon.png")),
                iconSize: 40,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const FriendColumn();
                })),
              ),
              IconButton(
                padding: const EdgeInsets.fromLTRB(0, 40, 28, 0),
                icon: const Image(image: AssetImage("img/face.png")),
                iconSize: 36,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Personal();
                  }));
                },
              ),
            ],
          ),
          Container(
              width: w * 0.86,
              height: 30,
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xFFFFE57F), width: 1.0)),
              ),
              child: const Image(
                image: AssetImage("img/Ting.png"),
                alignment: Alignment.topCenter,
              )),
          SizedBox(
            height: 320,
            child: LinearProgressIndicator(
              value: _time / 5.0, // 计算进度条的值（即进度百分比）
              backgroundColor: Colors.white10, // 进度条背景色
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFFE57F)), // 进度条颜色
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: IconButton(
                      icon: const Image(image: AssetImage("img/whisper.png")),
                      splashColor: Colors.transparent,
                      //highlightColor: Colors.transparent,
                      onPressed: () {},
                    ),
                  ),
                  const Text(
                    "悄悄话",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )
                ],
              ),
              Container(
                width: 90,
                height: 90,
                decoration: const BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.all(
                    Radius.circular(45),
                  ),
                ),
                child: haveRecord
                    ? IconButton(
                        icon: const Icon(Icons.play_arrow),
                        iconSize: 78,
                        color: const Color(0xFFFFE57F),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () async {},
                      )
                    : IconButton(
                        icon: isRecord ? const Icon(Icons.stop) : const Icon(Icons.mic),
                        iconSize: 78,
                        color: const Color(0xFFFFE57F),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () async {
                          if (!isRecord) {
                            await requestRecordPermission();
                            var tempDir = await getTemporaryDirectory();
                            var time = DateTime.now().millisecondsSinceEpoch;
                            String path = '${tempDir.path}/$time${ext[Codec.aacADTS.index]}';
                            print(path);
                            await _rec.openRecorder();
                            await _rec.startRecorder(
                              toFile: path,
                              codec: Codec.aacADTS,
                              bitRate: 8000,
                              numChannels: 1,
                              sampleRate: 8000,
                            );

                            _recSub = _rec.onProgress!.listen((e) {
                              var date = DateTime.fromMillisecondsSinceEpoch(
                                e.duration.inMilliseconds,
                                isUtc: true,
                              );
                              print(date);
                              if (date.second >= 5) {
                                _rec.stopRecorder();
                                setState(() {
                                  haveRecord = true;
                                  isRecord = !isRecord;
                                });
                                return;
                              }
                              print("date");
                              setState(() {
                                _time = (date.second * 1000 + date.millisecond) / 1000.0;
                              });
                            });
                            await _rec.setSubscriptionDuration(
                              const Duration(milliseconds: 50),
                            );
                            setState(() {
                              isRecord = !isRecord;
                            });
                          } else {
                            _rec.stopRecorder();
                            _rec.closeRecorder();
                            setState(() {
                              haveRecord = true;
                              isRecord = !isRecord;
                            });
                          }
                        },
                      ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: IconButton(
                      icon: const Image(image: AssetImage("img/change voice.png")),
                      splashColor: Colors.transparent,
                      //highlightColor: Colors.transparent,
                      onPressed: () {},
                    ),
                  ),
                  const Text(
                    "重录",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: h * 0.24,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(_createRoute());
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 30,
                  height: 0,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFFFE57F), width: 18, style: BorderStyle.solid),
                      right: BorderSide(width: 14, style: BorderStyle.solid),
                      left: BorderSide(color: Color(0xFFFFE57F), width: 14, style: BorderStyle.solid),
                    ),
                  ),
                ),
                Container(
                  width: w * 0.5,
                  height: 10,
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: Color(0xFFFFE57F), width: 2.5)),
                  ),
                ),
                Container(
                  width: w * 0.1,
                  height: 0,
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Color(0xFFFFE57F), width: 3.0)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: w * 0.32, height: 20),
                    SizedBox(
                      width: w * 0.5,
                      height: 30,
                      child: const Text(
                        "朋友的听汀",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const ListenPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
