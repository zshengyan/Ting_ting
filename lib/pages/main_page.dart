import 'package:flutter/material.dart';
import 'package:ting/pages/listen_friends_page.dart';
import '../components/FriendColumn.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    double w =MediaQuery.of(context).size.width;
    double h =MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                padding: const EdgeInsets.fromLTRB(28, 40, 0, 0),
                icon: const Image(image: AssetImage("img/friendsIcon.png")),
                iconSize: 40,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed:() =>
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const FriendColumn();
                    })),
              ),
              IconButton(
                padding: const EdgeInsets.fromLTRB(0, 40, 28, 0),
                icon: const Image(image: AssetImage("img/face.png")),
                iconSize: 36,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {  },
              ),
            ],
          ),
          Container(
            width: w*0.86,
            height: 80,
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFFFFE57F),width: 1.0)),
            ),
            child: const Image(
              image: AssetImage("img/Ting.png"),
              alignment: Alignment.topCenter,
            )
          ),
          const SizedBox(height: 350,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 80,
                      height: 80,
                      child: IconButton(
                        icon: const Image(image: AssetImage("img/whisper.png")),
                        splashColor: Colors.transparent,
                        //highlightColor: Colors.transparent,
                        onPressed: () {  },
                      ),
                  ),
                  const Text("悄悄话",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                    ),
                  )
                ],
              ),
              Container(
                width: 90,
                height: 90,
                decoration: const BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.all(
                    Radius.circular(45),
                  ),
                ),
                child: IconButton(
                  icon: const Icon(Icons.play_arrow_sharp),
                  iconSize: 78,
                  color: const Color(0xFFFFE57F),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {  },
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: IconButton(
                      icon: const Image(image: AssetImage("img/change voice.png")),
                      splashColor: Colors.transparent,
                      //highlightColor: Colors.transparent,
                      onPressed: () {  },
                    ),
                  ),
                  const Text("变声",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: h*0.24,),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(_createRoute());
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 30,
                  height: 0,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Color(0xFFFFE57F),
                          width: 18,
                          style: BorderStyle.solid),
                      right: BorderSide(
                          width: 14,
                          style: BorderStyle.solid),
                      left: BorderSide(
                          color: Color(0xFFFFE57F),
                          width: 14,
                          style: BorderStyle.solid),
                    ),
                  ),
                ),
                Container(
                  width: w*0.5,
                  height: 10,
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: Color(0xFFFFE57F),width: 2.5)),
                  ),
                ),
                Container(
                  width: w*0.1,
                  height: 0,
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Color(0xFFFFE57F),width: 3.0)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: w*0.32, height: 20, child: const Text("  "),),
                    SizedBox(
                      width: w*0.5,
                      height: 30,
                      child: const Text(
                        "朋友的听汀",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const ListenPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
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