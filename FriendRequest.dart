import 'package:flutter/material.dart';
import 'package:lyfpractice/FriendColumn.dart';

List<String> litems = ['用户1','用户2','用户3','用户4','用户5','用户6','用户7','用户8','用户9','用户10'];

class FriendRequest extends StatefulWidget {
  const FriendRequest({super.key});
  @override
  State<FriendRequest> createState() => _FriendRequestState();
}

class _FriendRequestState extends State<FriendRequest> {
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
                      image: AssetImage('pictures/arrowleft.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: MaterialButton(
                    onPressed: (){
                      //回到FriendColumn
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FriendColumn())
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
              width: 120,
              height: 40,
              margin: const EdgeInsets.fromLTRB(30, 26, 0, 0),
              child: const Text('好友申请',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
            Container(
              height: 506,
              width: 374,
              margin: const EdgeInsets.fromLTRB(28, 31, 28, 0),
              decoration: const BoxDecoration(
                  color: Color(0xFF303030)
              ),
              child: Expanded(
                  child: ListView.builder(
                      itemCount: litems.length,
                      itemBuilder: (BuildContext ctxt, int Index) {
                        return Column(
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
                                            image: AssetImage('pictures/user.png')
                                        )
                                    ),
                                  ),
                                  Container(
                                    width: 23.75,
                                  ),
                                  Text(
                                    litems[Index],
                                    style: const TextStyle(
                                      fontSize: 24,
                                      color: Color(0xFFFFEE8A),
                                    ),
                                  ),
                                  MaterialButton(
                                    onPressed: (){
                                      //同意添加好友

                                    },
                                    child: Container(
                                      width: 78,
                                      height: 40,
                                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: const Color(0xFFFFEE8A),
                                      ),
                                      child: const Text(
                                          '同意',
                                          textAlign: TextAlign.center,
                                          strutStyle: StrutStyle(
                                            height: 2.5,
                                            // 1.1更居中
                                            forceStrutHeight: true, // 关键属性 强制改为文字高度
                                          ),

                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xFF303030)
                                          )
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 17,
                            )
                          ],
                        );
                      }
                  )
              ),
            ),
          ],
        ),
      ),
    );

  }
}