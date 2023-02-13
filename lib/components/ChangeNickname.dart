import 'package:flutter/material.dart';
import 'package:ting/components/Personal.dart';


class ChangeNickname extends StatefulWidget {
  const ChangeNickname({super.key});
  @override
  State<ChangeNickname> createState() => _ChangeNicknameState();
}

class _ChangeNicknameState extends State<ChangeNickname> {


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
                      //回到个人界面Personal
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Personal())
                      );
                    },
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(70, 220, 0, 0),
              child: (
                  const Text('修改昵称',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFFFFFFFF),
                      height: 1.2,
                    ),
                  )
              ),
            ),
            Container(
                  margin: const EdgeInsets.fromLTRB(70, 16, 0, 0),
                  width: 290,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.all(
                        Radius.circular(20.0)),
                  ),
                  child: const TextField(
                    cursorColor: Color(0xFF656565),
                    cursorHeight: 29,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(
                            color: Colors.white38,
                          )
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: "此处应为原本的昵称",
                      labelStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,

                        color: Colors.black54,
                      ),
                      fillColor: Colors.white,
                    ),
                  ),
                ),
            Container(
              height: 74,
              width: 150,
              margin: const EdgeInsets.fromLTRB(140, 120, 0, 0),
              decoration: BoxDecoration(
                color: const Color(0xFFFFEE8A),
                borderRadius: BorderRadius.circular(20)
              ),
              child: TextButton(
                child: const Text(
                  '保存',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF303030),
                    letterSpacing: 6,
                  ),
                ),
                onPressed: (){
                  //找到特定的朋友
                  IfAccountExist(){
                    //若输入账号不存在，红色字体显现

                  }
                },
              ),
            ),
          ],
        ),
      ),
    );

  }
}