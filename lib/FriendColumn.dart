import 'package:flutter/material.dart';
import 'package:ting/SearchFriend.dart';
import 'package:ting/main_page.dart';
import 'FriendRequest.dart';

class FriendColumn extends StatefulWidget {
  const FriendColumn({super.key});

  @override
  State<FriendColumn> createState() => _FriendColumnState();
}

class _FriendColumnState extends State<FriendColumn> {

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
                      onPressed: () =>
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return const MainPage();
                          })),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 35,
                    margin: const EdgeInsets.fromLTRB(261.5, 33, 0, 0),
                    decoration: const BoxDecoration(
                      color: Color(0xFF303030),
                      image: DecorationImage(
                        image: AssetImage('img/alert.png'),
                      ),
                    ),
                    child: MaterialButton(
                      onPressed: () =>
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return const FriendRequest();
                          })),
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
                margin: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: const Align(
                  alignment: FractionalOffset(30/430, 0),
                  child: (
                      Text('我的朋友',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 27,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.normal,
                            color: Color(0xFFD2D2D2),

                            height: 1.2,
                          )
                      )
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(28, 12, 28, 0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0x7FFFEE8A),
                    width: 1.5,
                  )
                ),
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const SearchFriend();
                    })),
                child: Container(
                  margin: const EdgeInsets.fromLTRB(28, 31, 28, 0),
                  decoration: const BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  width: 370,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          color: const Color(0xFF303030),
                            border: Border.all(
                              color: const Color(0xFFFFE57F),
                              width: 4,
                            ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(27.5),
                          ),
                        ),
                        child: const Image(
                          image: AssetImage("img/add.png"),
                          alignment: Alignment.center ,
                        ),
                      ),
                      const Text("加好友",
                      style: TextStyle(
                        color: Color(0xFFFFE57F),
                        fontSize: 19,
                      ),
                      )
                    ],
                  ),
                ),
              )
              /*ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index){
                  return ListTile(
                      leading: const Icon(Icons.abc),
                      title: Text('items[index]'),
                   );
                },
              )*/

            ],
          ),
      ),
    );
    
  }
}