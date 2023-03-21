import 'package:flutter/material.dart';
import 'package:ting/components/FriendRequest.dart';
import 'package:ting/components/SearchFriend.dart';
import 'package:ting/pages/main_page.dart';
import 'package:ting/service/NetworkManager.dart';
import 'package:ting/components/menu.dart';
import 'package:ting/components/popmenu.dart';

List<String> litems = ['用户1','用户2','用户3','用户4','用户5','用户6','用户7','用户8','用户9','用户10'];
List<String>? FriendName;
List<String>? FriendIcon;
var fl = LYFHttpRequest.getFriendList();

class FriendColumn extends StatefulWidget {
  const FriendColumn({super.key});


  @override
  State<FriendColumn> createState() => _FriendColumnState();
}

class _FriendColumnState extends State<FriendColumn> {
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
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
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
                      onPressed: (){
                        //回到主界面
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage())
                        );
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
                      onPressed: (){
                        //进入新好友申请
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FriendRequest())
                        );
                      },
                    ),
                  ),

                ],
              ),
              const Align(
                alignment: FractionalOffset(212/430, 69/932),
                child: (
                  Text('Ting',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFFD2D2D2),
                      height: 1.2,
                    ),
                  )
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: const Align(
                  alignment: FractionalOffset(30/430, 0),
                  child: (
                      Text('我的朋友',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.normal,
                            color: Color(0xFFD2D2D2),

                            height: 1.2,
                          )
                      )
                  ),
                ),
              ),      //我的朋友
              Container(
                margin: const EdgeInsets.fromLTRB(28, 12, 28, 0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0x7FFFEE8A),
                    width: 1.5,
                  )
                ),
              ),     //这是分割线
              Container(
                height: 506,
                width: 374,
                margin: const EdgeInsets.fromLTRB(28, 31, 28, 0),
                decoration: const BoxDecoration(
                  color: Color(0xFF303030)
                ),
                child: Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            itemCount: litems.length,
                            itemBuilder: (BuildContext ctxt, int Index) {
                              return GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onLongPressStart: (details) async {
                                    if (items.isNotEmpty) {
                                      await Popmenu.showPopupMenu(context, details, items);
                                    }
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
                                            width: 70,
                                            height: 70,
                                            decoration: BoxDecoration(
                                                color: const Color(0xFFD2D2D2),
                                                borderRadius: BorderRadius.circular(35),
                                                image: const DecorationImage(
                                                    scale: 2,
                                                    image: AssetImage('img/user big.png')  //网络请求
                                                )
                                            ),
                                          ),
                                          Container(
                                            width: 23.75,
                                          ),
                                          Text(
                                            litems[Index],      //网络请求
                                            style: const TextStyle(
                                              fontSize: 24,
                                              color: Color(0xFFFFEE8A),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 17,
                                    )
                                  ],
                                ),
                              );
                            }
                        )
                    ),
                  ],
                )

                    ),   //滑动列表
              Container(
                width: 370,
                height: 70,
                margin: const EdgeInsets.fromLTRB(13, 10, 28, 0),
                child: MaterialButton(
                  onPressed: (){
                    //进入加好友页面，按照好友账号搜寻
                    print(fl);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchFriend())
                    );
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
                              image: const DecorationImage(
                                  scale: 1,
                                  image: AssetImage('img/add.png')
                              )
                          ),
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
        ),
      )
              /*MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context,index){
                    return _item(context,index);
                  },

                ),
              )*/

    );
  }
}
