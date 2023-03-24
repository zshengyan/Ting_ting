import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ting/components/SearchFriend.dart';
import 'package:ting/pages/main_page.dart';
import 'package:ting/pages/whisper_page.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:ting/service/api_service.dart';
import 'package:ting/service/auth_service.dart';

class Message {
  String id;
  String nickname;
  String avatarUrl;
  String audioPath;
  String title;

  @override
  String toString() {
    return 'Message{id: $id, nickname: $nickname, avatarUrl: $avatarUrl, audioPath: $audioPath, title: $title}';
  }

  Message({
    required this.id,
    required this.nickname,
    required this.avatarUrl,
    required this.audioPath,
    required this.title,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      nickname: json['sender']["nickname"],
      avatarUrl: json['sender']["avatar"] ?? "default.png",
      audioPath: json['file'],
      title: json['desc'],
    );
  }
}

class ListenPage extends StatefulWidget {
  const ListenPage({Key? key}) : super(key: key);

  @override
  State<ListenPage> createState() => _ListenPageState();
}

class _ListenPageState extends State<ListenPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white10,
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                    width: 55,
                    height: 40,
                    margin: const EdgeInsets.fromLTRB(54, 40, 0, 0),
                    padding: const EdgeInsets.only(bottom: 5),
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Color(0xFFFFE57F), width: 2.0)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "朋友",
                          style: TextStyle(fontSize: 24, color: Color(0xFFFFE57F)),
                        ),
                      ],
                    )),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.only(top: 50),
                    child: const Icon(
                      Icons.keyboard_double_arrow_down_sharp,
                      size: 50,
                      color: Color(0xFFFFE57F),
                    )),
              ),
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const WhisperPage();
                })),
                child: Container(
                    width: 80,
                    height: 35,
                    margin: const EdgeInsets.fromLTRB(0, 40, 50, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "悄悄话",
                          style: TextStyle(fontSize: 24, color: Colors.grey),
                        ),
                      ],
                    )),
              ),
            ],
          ),
          ..._msgList
              .map((e) => TweetCard(
                    id: e.id,
                    title: e.title,
                    nickname: e.nickname,
                    avatarUrl: e.avatarUrl,
                    audioPath: e.audioPath,
                  ))
              .toList(),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _refreshMessage();
  }

  int page = 0;

  List<Message> _msgList = [];

  Future<void> _refreshMessage() async {
    print("ggg");
    var api = ApiService.instance;
    var res = await api.getList(page);
    print(res);
    setState(() {
      _msgList = res ?? [];
    });
  }
}

class TweetCard extends StatefulWidget {
  final String id;
  final String title;
  final String nickname;
  final String avatarUrl;
  final String audioPath;

  const TweetCard({
    Key? key,
    required this.id,
    required this.title,
    required this.nickname,
    required this.avatarUrl,
    required this.audioPath,
  }) : super(key: key);

  @override
  _TweetCardState createState() => _TweetCardState();
}

class _TweetCardState extends State<TweetCard> {
  bool _isLiked = false;
  List<Friend> _likedUsers = [];

  @override
  void initState() {
    super.initState();
    _getLikeStatus();
    _updateLike();
  }

  Future<void> _updateLike() async {
    var api = ApiService.instance;
    var res = await api.getLikes(widget.id);
    setState(() {
      _likedUsers = res ?? [];
    });
  }

  Future<void> _getLikeStatus() async {
    var api = ApiService.instance;
    var res = await api.getLikeStatus(widget.id);
    setState(() {
      _isLiked = res ?? false;
    });
  }

  //TODO: 点赞
  Future<void> _toggleLike() async {
    var api = ApiService.instance;
    await api.updateLike(widget.id);
    _getLikeStatus();
    _updateLike();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Card(
        color: Colors.white12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: CircleAvatar(
                radius: 24,
                backgroundColor: const Color(0x00000000),
                backgroundImage: NetworkImage("$baseURL/assets/avatar/${widget.avatarUrl}"),
              ),
              title: Text(
                widget.nickname,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                "@${widget.title}",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: InkWell(
                onTap: _toggleLike,
                child: Icon(
                  _isLiked ? Icons.favorite : Icons.favorite_border,
                  color: _isLiked ? const Color(0xFFFF6B6B) : const Color(0xFFBDBDBD),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Row(
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            AudioProgressBar(
              audioPath: widget.audioPath,
            ),
            Visibility(
              visible: _likedUsers.isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Row(
                  children: [
                    const Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    ),
                    const SizedBox(width: 10),
                    ..._likedUsers
                        .map((e) => Container(
                              margin: const EdgeInsets.all(5),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white54,
                                backgroundImage: NetworkImage("$baseURL/assets/avatar/${e.avatar}"),
                              ),
                            ))
                        .toList()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AudioProgressBar extends StatefulWidget {
  final String audioPath;

  const AudioProgressBar({
    Key? key,
    required this.audioPath,
  }) : super(key: key);

  @override
  _AudioProgressBarState createState() => _AudioProgressBarState();
}

class _AudioProgressBarState extends State<AudioProgressBar> {
  final FlutterSoundPlayer _player = FlutterSoundPlayer();

  bool _isPlaying = false;
  double _playPosition = 0.0;
  double _duration = 0.0;

  void _play() async {
    await _player.stopPlayer();
    await _player.openPlayer();
    Dio dio = Dio();
    var p = "${(await getApplicationDocumentsDirectory()).path}/${widget.audioPath}";
    var path = "$baseURL/assets/media/${widget.audioPath}";
    print(path);
    var response = await dio.download(path, p);
    print("success");
    await _player.startPlayer(
      fromURI: p,
      whenFinished: () {
        print("finish");
        setState(() {
          _isPlaying = false;
          _playPosition = 0;
        });
      },
    );
    _player.onProgress!.listen((event) {
      setState(() {
        _duration = event.duration.inMilliseconds / 1.0;
        _playPosition = event.position.inMilliseconds / 1.0;
      });
      if (event.duration.inMilliseconds == event.position.inMilliseconds) {
        print("finish");
        setState(() {
          _isPlaying = false;
          _playPosition = 0;
        });
      }
    });
    _player.setSubscriptionDuration(const Duration(milliseconds: 1));
    await _player.startPlayer(fromURI: "$baseURL/assets/media/${widget.audioPath}");
    setState(() {
      _isPlaying = true;
    });
  }

  void _stop() async {
    print("stop");
    await _player.stopPlayer();
    setState(() {
      _isPlaying = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              _isPlaying ? Icons.pause : Icons.play_arrow,
              color: const Color(0xFFFFE57F),
            ),
            onPressed: _isPlaying ? () => _stop() : () => _play(),
          ),
          Expanded(
            child: Slider(
              value: _playPosition,
              max: _duration,
              onChanged: (value) {},
              activeColor: const Color(0xFFFFE57F),
              inactiveColor: const Color(0xFFBDBDBD),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              Duration(milliseconds: _playPosition.toInt()).toString().split('.').first,
              style: const TextStyle(
                color: Color(0xFF666666),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
