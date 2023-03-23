import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ting/service/api_service.dart';

class SendPage extends StatefulWidget {
  String path;

  SendPage({
    super.key,
    required this.path,
  });

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  final TextEditingController _desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF303030),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      color: Color(0xFF303030),
                      image: DecorationImage(
                        image: AssetImage('img/arrowleft.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: () async {
                    if (_desc.text == "") {
                      Fluttertoast.showToast(msg: "不可为空");
                      return;
                    }
                    var api = ApiService.instance;
                    if (await api.sendFile(widget.path, _desc.text)) {
                      Fluttertoast.showToast(msg: "发布成功");
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      color: Color(0xFF303030),
                      image: DecorationImage(
                        image: AssetImage('img/share.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Image(
                  image: AssetImage("img/Ting.png"),
                  alignment: Alignment.topCenter,
                ),
              ],
            ),
            const SizedBox(height: 40),
            Column(
              children: [
                Container(
                  width: 370.0,
                  height: 124.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD2D2D2),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _desc,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(20.0),
                            hintText: "这一刻的想法",
                          ),
                          maxLines: 5, // 最大行数
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
