import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ting/components/Personal.dart';

import '../service/api_service.dart';
import '../service/auth_service.dart';

class PersonalAudio extends StatefulWidget {
  const PersonalAudio({super.key});

  @override
  State<PersonalAudio> createState() => _PersonalAudioState();
}

class Msg {
  String id;
  String name;
  String date;
  String path;

  Msg({
    required this.id,
    required this.name,
    required this.date,
    required this.path,
  });

  @override
  String toString() {
    return 'Msg{id: $id, name: $name, date: $date, path: $path}';
  }

  factory Msg.fromJson(Map<String, dynamic> json) {
    return Msg(
      id: json['id'] ?? "",
      name: json['desc'] ?? '',
      date: json['dateTime'] ?? '',
      path: json['file'] ?? '',
    );
  }
}

class _PersonalAudioState extends State<PersonalAudio> {
  List<Msg> _msg = [];

  final FlutterSoundPlayer _player = FlutterSoundPlayer();

  var _playing = -1;

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
                    //回到个人简介页面Personal
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
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(75),
              color: const Color(0xFFD2D2D2),
            ),
            height: 120,
            width: 120,
            margin: const EdgeInsets.fromLTRB(145, 53, 0, 0),
            child: Center(
              child: _avatar != ""
                  ? ClipOval(
                      child: Image.network(
                      "$_avatar?${DateTime.now().millisecondsSinceEpoch}",
                    ))
                  : const Image(
                      image: AssetImage('img/user.png'),
                    ),
            ),
          ),
          Container(
            width: 80,
            height: 48,
            margin: const EdgeInsets.fromLTRB(173, 17, 0, 0),
            child: Text(
              _nickname,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontFamily: 'Inter',
                fontSize: 32,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
                width: double.infinity,
                child: _msg.length == 0
                    ? Column(
                        children: const [
                          Center(
                            child: Text(
                              "你还没有发过消息",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )
                    : ListView.builder(
                        itemCount: _msg.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          return OutlinedButton(
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 0, vertical: 0)),
                            ),
                            onPressed: () {
                              //进入好友基本简介页面
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color(0xFF3E3E3E),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 87,
                                        height: 87,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(image: AssetImage('img/voice.png'))),
                                      ),
                                      Container(
                                        width: 23,
                                      ),
                                      Container(
                                        width: 110,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              _msg[index].name,
                                              style: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xFFFFFFFF),
                                              ),
                                            ),
                                            Text(
                                              _msg[index].date,
                                              style: const TextStyle(
                                                fontSize: 15,
                                                color: Color(0xFFD2D2D2),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      OutlinedButton(
                                        onPressed: () async {
                                          if (_playing == index) {
                                            // Stop playing the current audio
                                            await _player.stopPlayer();
                                            setState(() {
                                              _playing = -1;
                                            });
                                          } else {
                                            // Play the new audio
                                            await _player.stopPlayer();
                                            await _player.openPlayer();
                                            Dio dio = Dio();
                                            var p = "${(await getApplicationDocumentsDirectory()).path}/temp.aac";
                                            var path = "$baseURL/assets/media/${_msg[index].path}";
                                            print(p);
                                            print(path);
                                            var response = await dio.download(path, p);
                                            print("download success");
                                            await _player.startPlayer(
                                              fromURI: p,
                                              whenFinished: () {
                                                // This callback will be called when the audio finishes playing
                                                setState(() {
                                                  _playing = -1;
                                                });
                                              },
                                            );
                                            setState(() {
                                              _playing = index;
                                            });
                                          }
                                        },
                                        style: ButtonStyle(
                                          minimumSize: MaterialStateProperty.all(const Size(1, 1)),
                                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                                        ),
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: _playing == index
                                                      ? const AssetImage("img/pause1.png")
                                                      : const AssetImage('img/start.png'))),
                                        ),
                                      ),
                                      Container(
                                        width: 18,
                                      ),
                                      OutlinedButton(
                                        onPressed: () => _showDeleteConfirmationDialog(_msg[index].id),
                                        style: OutlinedButton.styleFrom(
                                          foregroundColor: const Color(0xFFFFE57F),
                                          minimumSize: const Size(32, 32),
                                          padding: const EdgeInsets.all(8),
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(16)),
                                          ),
                                        ),
                                        child: const Icon(Icons.delete, size: 32),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 8,
                                )
                              ],
                            ),
                          );
                        })),
          ), //滑动列表
        ],
      ),
    );
  }

  String _nickname = "";
  String _avatar = "";

  @override
  void initState() {
    super.initState();
    _initAvatar();
    _initNickname();
    _initSelfMessage();
  }

  Future<void> _initSelfMessage() async {
    var api = ApiService.instance;
    var res = await api.mineVoice();
    if (res == null) return;
    setState(() {
      _msg = res;
    });
    print(res);
  }

  Future<void> _initAvatar() async {
    var api = ApiService.instance;
    var path = await api.getAvatarPath();
    if (path == null) return;
    setState(() {
      _avatar = "$baseURL/assets/avatar/$path";
    });
  }

  Future<void> _showDeleteConfirmationDialog(String id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // 用户必须点击“确定”或“取消”
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('删除项目'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('您确定要删除此项目吗？'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('确定'),
              onPressed: () async {
                var api = ApiService.instance;
                if (await api.deleteMessage(id)) {
                  Fluttertoast.showToast(msg: "删除成功");
                  _initSelfMessage();
                }
                if (mounted) {
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _initNickname() async {
    var api = ApiService.instance;
    var nickname = await api.getUserInfo("nickname");
    if (nickname == null) return;
    setState(() {
      _nickname = nickname;
    });
  }
}
