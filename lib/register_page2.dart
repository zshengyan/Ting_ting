import 'package:flutter/material.dart';

class RegisterPage2 extends StatefulWidget {
  const RegisterPage2({Key? key}) : super(key: key);

  @override
  State<RegisterPage2> createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white10,
      body: SingleChildScrollView(
        reverse: true,
        child: SizedBox(
          height: MediaQuery.of(context).size.height*0.95,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                margin: const EdgeInsets.fromLTRB(0, 130, 0, 0),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFE57F),
                  borderRadius: BorderRadius.all(
                    Radius.circular(75),
                  ),
                ),
                child: IconButton(
                  icon: const Icon(Icons.local_see),
                  iconSize: 60,
                  color: Colors.black,
                  onPressed: () {  },
                ),
              ),
              const SizedBox(height: 19,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "拍摄你的听汀头像",
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.white
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40,),
              Container(
                width: 320,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                        Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          offset: const Offset(1, 1),
                          color: Colors.white.withOpacity(0.8)
                      )
                    ]
                ),
                child: const TextField(
                  cursorColor: Colors.black54,
                  cursorHeight: 20,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                            color: Colors.white38,
                          )
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(20.0))
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: "  请设置昵称",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                      fillColor: Colors.white
                  ),
                ),
              ),
              Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 80,),
                        Expanded(child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFFE57F)
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: (){},
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.fromLTRB(70, 7, 69, 8),
                                  foregroundColor: Colors.black,
                                  textStyle: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 6
                                  ),
                                ),
                                child: const Text('完成注册'),
                              ),
                            ],
                          ),
                        ),
                        ),
                        const SizedBox(width: 80,),
                      ],
                    ),
                  ),
                  Padding(padding: MediaQuery.of(context).viewInsets),
                ],
              )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
