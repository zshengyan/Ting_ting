import 'package:flutter/material.dart';
import 'package:ting/components/Personal.dart';

List<String> litems = ['用户1','用户2','用户3','用户4','用户5','用户6','用户7','用户8','用户9','用户10'];


class Collection extends StatefulWidget {
  const Collection({super.key});


  @override
  State<Collection> createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {

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
                    Text('收藏',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal,
                        color: Color(0xFFFFFFFF),
                        height: 1.2,
                      ),
                    )
                ),
              ),
              Container(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(28, 0, 28, 0),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0x7FFFEE8A),
                      width: 1,
                    )
                ),
              ),     //这是分割线
              Container(
                height: 760,
                width: 405,
                margin: const EdgeInsets.fromLTRB(13, 0, 13, 0),
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
                                        child: Container(
                                          height: 55,
                                          width: 55,
                                          margin: EdgeInsets.fromLTRB(26, 13, 0, 13),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(55),
                                              color: Color(0xFFD2D2D2)
                                          ),
                                          child: Center(
                                            child: Image(
                                              image: AssetImage('pictures/user.png'),
                                              width: 40,
                                              height: 40,
                                            ),
                                          )
                                        ),
                                      ),
                                      Container(
                                        width: 23,
                                      ),
                                      Container(
                                        width: 176,
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
              ),


            ],
          ),
        )
    );
  }
}
