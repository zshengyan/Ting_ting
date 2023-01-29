import 'package:flutter/material.dart';
import 'package:ting/SearchFriend.dart';

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
                      image: AssetImage('img/arrowleft.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: MaterialButton(
                    onPressed: () =>
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const SearchFriend();
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(75),
                color: const Color(0xFFD2D2D2),
              ),
              height: 150,
              width: 150,
              margin: const EdgeInsets.fromLTRB(135, 102, 0, 0),
              child: const Image(
              image: AssetImage('img/user big.png'),
              ),
            ),
            Container(
              width: 80,
              height: 48,
              margin: const EdgeInsets.fromLTRB(170, 28, 0, 0),
              child: const Text('昵称',
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
              margin: const EdgeInsets.fromLTRB(112, 209, 0, 0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color(0xFFFFEE8A)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 14.0, vertical: 6.0)),
                  minimumSize: MaterialStateProperty.all(const Size(0, 0)),
                  maximumSize: MaterialStateProperty.all(const Size(375.0, 36.0)),
                ),
                onPressed: () {
                  //加为好友并且退回好友界面
                },
                child: const Text(
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