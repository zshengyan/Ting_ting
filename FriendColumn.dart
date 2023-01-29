import 'package:flutter/material.dart';



class FriendColumn extends StatefulWidget {

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
                  Container(
                    height: 45,
                    width: 45,
                    margin: const EdgeInsets.fromLTRB(261.5, 33, 0, 0),
                    decoration: const BoxDecoration(
                      color: Color(0xFF303030),
                      image: DecorationImage(
                        image: AssetImage('pictures/alert.png'),
                      ),
                    ),
                    child: MaterialButton(
                      onPressed: (){},
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
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: const Align(
                  alignment: FractionalOffset(30/430, 0),
                  child: (
                      Text('我的朋友',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 30,
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