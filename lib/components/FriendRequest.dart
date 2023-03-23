import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ting/components/FriendColumn.dart';
import 'package:ting/components/SearchFriend.dart';
import 'package:ting/service/api_service.dart';
import 'package:ting/service/auth_service.dart';

class FriendRequest extends StatefulWidget {
  const FriendRequest({super.key});

  @override
  State<FriendRequest> createState() => _FriendRequestState();
}

class _FriendRequestState extends State<FriendRequest> {
  final formkey = GlobalKey<FormState>();

  List<Friend> _friendList = [];

  @override
  void initState() {
    super.initState();
    _updateRequest();
  }

  Future<void> _updateRequest() async {
    var api = ApiService.instance;
    var res = await api.getFriendRequest();
    if (res == null) return;
    setState(() {
      _friendList = res;
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
                    //回到FriendColumn
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
            width: 120,
            height: 40,
            margin: const EdgeInsets.fromLTRB(30, 26, 0, 0),
            child: const Text(
              '好友申请',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
          Expanded(
            child: Visibility(
              visible: _friendList.isNotEmpty,
              child: RefreshIndicator(
                onRefresh: () async {
                  await _updateRequest();
                },
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
                                    return AlertDialog(
                                      title: Text("添加好友"),
                                      content: Text("确定要添加好友吗？"),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text("取消"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        ElevatedButton(
                                          child: Text("确定"),
                                          onPressed: () async {
                                            var api = ApiService.instance;
                                            if (await api.acceptRequest(_friendList[index].id)) {
                                              Fluttertoast.showToast(msg: "添加成功");
                                              _updateRequest();
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
          ),
        ],
      ),
    );
  }
}
