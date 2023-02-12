import 'package:flutter/material.dart';
import 'package:lyfpractice/Personal.dart';

List<String> litems = ['用户1','用户2','用户3','用户4','用户5','用户6','用户7','用户8','用户9','用户10'];

class PersonalAudio extends StatefulWidget {
  const PersonalAudio({super.key});
  @override
  State<PersonalAudio> createState() => _PersonalAudioState();
}

class _PersonalAudioState extends State<PersonalAudio> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF303030),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: false,
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
                      //回到个人简介页面Personal
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Personal())
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(75),
                color: const Color(0xFFD2D2D2),
              ),
              height: 120,
              width: 120,
              margin: const EdgeInsets.fromLTRB(145, 53, 0, 0),
              child: Center(
                child: const Image(
                  image: AssetImage('pictures/user.png'),
                  width: 80,
                  height: 80,
                ),
              )
            ),
            Container(
              width: 80,
              height: 48,
              margin: const EdgeInsets.fromLTRB(173, 17, 0, 0),
              child: const Text('昵称',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Inter',
                    fontSize: 32,
                    color: Color(0xFFFFFFFF)
                ),
              ),
            ),
            Container(
              height: 506,
              width: 405,
              margin: const EdgeInsets.fromLTRB(13, 60, 13, 0),
              decoration: const BoxDecoration(
                  color: Color(0xFF303030)
              ),
              child: Expanded(
                  child: ListView.builder(
                      itemCount: litems.length,
                      itemBuilder: (BuildContext ctxt, int Index) {
                        return OutlinedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(horizontal: 0, vertical: 0)),
                          ),

                          onPressed: (){
                            //进入好友基本简介页面

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
                                      width: 87,
                                      height: 87,
                                      decoration: BoxDecoration(
                                          image: const DecorationImage(
                                              image: AssetImage('pictures/voice.png')
                                          )
                                      ),
                                    ),
                                    Container(
                                      width: 23,
                                    ),
                                    Container(
                                      width: 143,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            litems[Index],

                                            style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xFFFFFFFF),
                                            ),
                                          ),
                                          Text(
                                            litems[Index],
                                            style: const TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFFD2D2D2),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    OutlinedButton(
                                      onPressed: (){
                                        //播放该段录音

                                      },
                                      style: ButtonStyle(
                                        minimumSize: MaterialStateProperty.all(Size(1, 1)),
                                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                                      ),
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage('pictures/start.png')
                                          )
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 18,
                                    ),
                                    OutlinedButton(
                                      onPressed: (){
                                        //展开

                                      },
                                      style: ButtonStyle(
                                        minimumSize: MaterialStateProperty.all(Size(1, 1)),
                                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                                      ),
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage('pictures/more.png')
                                            )
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 8,
                              )
                            ],
                          ),
                        );
                      }
                  )
              ),
            ),   //滑动列表
          ],
        ),
      ),
    );

  }
}