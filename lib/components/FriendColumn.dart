import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ting/components/FriendRequest.dart';
import 'package:ting/components/SearchFriend.dart';
import 'package:ting/pages/main_page.dart';
import 'package:ting/components/menu.dart';
import 'package:ting/components/popmenu.dart';
import 'package:ting/service/api_service.dart';
import 'package:ting/service/auth_service.dart';

class FriendColumn extends StatefulWidget {
  const FriendColumn({super.key});

  @override
  State<FriendColumn> createState() => _FriendColumnState();
}

class _FriendColumnState extends State<FriendColumn> {
  List<Friend> _friendList = [];

  @override
  void initState() {
    super.initState();
    _updateFriend();
  }

  Future<void> _updateFriend() async {
    var api = ApiService.instance;
    var res = await api.getFriendList();
    setState(() {
      _friendList = res ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Context> items = [];
    items.add(
      Context(
        text: Image(image: AssetImage('img/option1.png')),
        onTap: () {
          //需要网络请求删除好友
          print('删除好友');
          Navigator.pop(context);
        },
      ),
    );
    items.add(
      Context(
        text: Image(image: AssetImage('img/option2.png')),
        onTap: () {
          //直接取消弹出菜单
          Navigator.pop(context);
        },
      ),
    );

    return Scaffold(
        backgroundColor: const Color(0xFF303030),
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                Container(
                  height: 45,
                  width: 45,
                  margin: const EdgeInsets.fromLTRB(261.5, 33, 0, 0),
                  decoration: const BoxDecoration(
                    color: Color(0xFF303030),
                    image: DecorationImage(
                      image: AssetImage('img/alert.png'),
                    ),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      //进入新好友申请
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FriendRequest()));
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
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: const Align(
                alignment: FractionalOffset(30 / 430, 0),
                child: (Text('我的朋友',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFFD2D2D2),
                      height: 1.2,
                    ))),
              ),
            ), //我的朋友
            Container(
              margin: const EdgeInsets.fromLTRB(28, 12, 28, 0),
              decoration: BoxDecoration(
                  border: Border.all(
                color: const Color(0x7FFFEE8A),
                width: 1.5,
              )),
            ), //这是分割线
            Expanded(
              child: RefreshIndicator(
                onRefresh: _updateFriend,
                child: ListView.builder(
                  itemCount: _friendList.length,
                  itemBuilder: (ctx, index) {
                    return Container(
                      margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(15),
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
                                style: const TextStyle(fontSize: 25, color: Colors.white),
                              ),
                              Text(
                                "@${_friendList[index].username}",
                                style: const TextStyle(fontSize: 15, color: Colors.white),
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
                                      title: const Text("删除好友"),
                                      content: const Text("确定要删除好友吗？"),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text("取消"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        ElevatedButton(
                                          child: const Text("确定"),
                                          onPressed: () async {
                                            var api = ApiService.instance;
                                            if (await api.deleteFriend(_friendList[index].id)) {
                                              Fluttertoast.showToast(msg: "好友删除成功");
                                              _updateFriend();
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
                                backgroundColor: const Color(0xFFFFE57F),
                                foregroundColor: Colors.black,
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(10),
                              ),
                              child: const Icon(Icons.remove)),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              width: 370,
              height: 70,
              margin: const EdgeInsets.fromLTRB(13, 10, 28, 0),
              child: MaterialButton(
                onPressed: () {
                  //进入加好友页面，按照好友账号搜寻
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchFriend()));
                },
                child: Container(
                  width: 370,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xFF303030),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            color: const Color(0xFF303030),
                            border: Border.all(
                              color: const Color(0xFFFFEE8A),
                              width: 5,
                            ),
                            borderRadius: BorderRadius.circular(35),
                            image: const DecorationImage(scale: 1, image: AssetImage('img/add.png'))),
                      ),
                      Container(
                        width: 23.75,
                      ),
                      const Text(
                        '加好友',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFFFFEE8A),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        )
        /*MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context,index){
                    return _item(context,const index);
                  },

                ),
              )*/

        );
  }
}
