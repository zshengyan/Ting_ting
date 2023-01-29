import 'package:flutter/material.dart';

var visibility = false;

class SpecificFriend extends StatefulWidget {
  const SpecificFriend({super.key});
  @override
  State<SpecificFriend> createState() => _SpecificFriendState();
}

class _SpecificFriendState extends State<SpecificFriend> {
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(75),
                color: Color(0xFFD2D2D2),
              ),
              height: 150,
              width: 150,
              margin: EdgeInsets.fromLTRB(135, 102, 0, 0),
              child: Image(
              image: AssetImage('pictures/user.png'),
              ),
            ),
            Container(
              width: 80,
              height: 48,
              margin: EdgeInsets.fromLTRB(170, 28, 0, 0),
              child: Text('昵称',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Inter',
                  fontSize: 40,
                  color: Color(0xFFD2D2D2)
                ),
              ),
            ),
            Container(
              width: 206,
              height: 74,
              margin: EdgeInsets.fromLTRB(112, 209, 0, 0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFFFFEE8A)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 14.0, vertical: 6.0)),
                  minimumSize: MaterialStateProperty.all(Size(0, 0)),
                  maximumSize: MaterialStateProperty.all(Size(375.0, 36.0)),
                ),
                onPressed: () {
                  //加为好友并且退回好友界面
                },
                child: Text(
                  '加为好友',
                  style: TextStyle(
                    color: Color(0xFF303030),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                  ),
                ),
              ),


            )
          ],
        ),
      ),
    );

  }
}