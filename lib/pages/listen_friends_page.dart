import 'package:flutter/material.dart';
import 'package:ting/pages/main_page.dart';
import 'package:ting/pages/whisper_page.dart';

class ListenPage extends StatefulWidget {
  const ListenPage({Key? key}) : super(key: key);

  @override
  State<ListenPage> createState() => _ListenPageState();
}

class _ListenPageState extends State<ListenPage> {
  @override
  Widget build(BuildContext context) {
    double w =MediaQuery.of(context).size.width;
    double h =MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){ },
                child: Container(
                  width: 55,
                  height: 40,
                  margin: const EdgeInsets.fromLTRB(54, 40, 0, 0),
                  padding: const EdgeInsets.only(bottom: 5),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Color(0xFFFFE57F),width: 2.0)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "朋友",
                        style: TextStyle(
                            fontSize: 24,
                            color: Color(0xFFFFE57F)
                        ),
                      ),
                    ],
                  )
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(_createRoute());
                },
                child: Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.only(top: 50),
                    child: const Icon(Icons.keyboard_double_arrow_down_sharp,
                      size: 50,
                      color: Color(0xFFFFE57F),
                    )
                ),
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const WhisperPage();
                    })),
                child: Container(
                    width: 80,
                    height: 35,
                    margin: const EdgeInsets.fromLTRB(0, 40, 50, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "悄悄话",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.grey
                          ),
                        ),
                      ],
                    )
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    decoration: const BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: const Image(image: AssetImage("img/user(1).png",),),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("昵称   ",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                width: w*0.86,
                height: 13,
                margin: const EdgeInsets.only(bottom: 5),
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Color(0xFFFFE57F),width: 1.0)),
                ),
              ),
              RichText(text: const TextSpan(
                text: "标题",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                 TextSpan(
                   text: "  19分钟前",
                   style: TextStyle(
                     fontSize: 11,
                     color: Colors.white38
                   )
                 )
                ]
              )),
              SizedBox(
                height: 50,
                width: w*0.8,
                child: const Text(
                  "描述...",
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.grey
                  ),
                ),
              ),
              const SizedBox(height: 110,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () { },
                    child: Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(left: 30),
                      child: const Image(image: AssetImage("img/replay1.png",),),
                    ),
                  ),
                  GestureDetector(
                    onTap: () { },
                    child: const SizedBox(
                      width: 45,
                      height: 50,
                      child: Image(image: AssetImage("img/pause.png",),),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(right: 30),
                    child: const Image(image: AssetImage("img/replay2.png",),),
                  )
                ],
              ),
              Container(
                width: w*0.86,
                height: 37,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Color(0xFFFFE57F),width: 1.0)),
                ),
              ),
              SizedBox(
                width: w*0.82,
                height: 35,
                child: Row(
                  children: [
                    const Image(image: AssetImage("img/likes.png",),),
                    Container(
                      width: 35,
                      height: 35,
                      margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                      decoration: const BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.all(
                          Radius.circular(17.5),
                        ),
                      ),
                      child: const Image(image: AssetImage("img/user.png",),),
                    ),
                    Container(
                      width: 35,
                      height: 35,
                      margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      decoration: const BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.all(
                          Radius.circular(17.5),
                        ),
                      ),
                      child: const Image(image: AssetImage("img/user.png",),),
                    ),
                    Container(
                      width: 35,
                      height: 35,
                      margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      decoration: const BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.all(
                          Radius.circular(17.5),
                        ),
                      ),
                      child: const Image(image: AssetImage("img/user.png",),),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: h*0.26,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () { },
                        child: Container(
                          width: 70,
                          height: 70,
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          decoration: const BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.all(Radius.circular(15),),
                              image: DecorationImage(image: AssetImage("img/likes(1).png"),
                              )
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () { },
                        child: Container(
                          width: 70,
                          height: 70,
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          decoration: const BoxDecoration(
                              color: Colors.white38,
                              borderRadius: BorderRadius.all(Radius.circular(15),),
                              image: DecorationImage(image: AssetImage("img/recommend.png"),
                              )
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () { },
                        child: Container(
                          width: 70,
                          height: 70,
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          decoration: const BoxDecoration(
                              color: Colors.white38,
                              borderRadius: BorderRadius.all(Radius.circular(15),),
                              image: DecorationImage(image: AssetImage("img/collect.png"),
                              )
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const MainPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, -1.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
