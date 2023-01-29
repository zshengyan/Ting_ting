import 'package:flutter/material.dart';

var visibility = false;

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
                      //回到主界面

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
              margin: EdgeInsets.fromLTRB(30, 26, 0, 0),
              child: Text('好友申请',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),

          ],
        ),
      ),
    );

  }
}