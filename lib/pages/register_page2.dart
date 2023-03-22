import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ting/pages/login_page.dart';
import 'package:ting/service/auth_service.dart';

class RegisterPage2 extends StatefulWidget {
  final String usr, pwd, question, ans;

  const RegisterPage2({
    Key? key,
    required this.usr,
    required this.pwd,
    required this.question,
    required this.ans,
  }) : super(key: key);

  @override
  State<RegisterPage2> createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  final _nickName = TextEditingController();

  final picker = ImagePicker();
  XFile? _avatar;

  Future<void> selectFile(ImageSource source) async {
    final file = await picker.pickImage(source: source);
    if (file != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: file.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxWidth: 800,
        maxHeight: 800,
        compressFormat: ImageCompressFormat.jpg,
      );
      setState(() {
        _avatar = XFile(croppedFile!.path);
      });
    }
  }

  void _chooseImage() async {
    Widget cameraButton = TextButton(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
      child: const Text(
        "相机",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      onPressed: () async {
        await selectFile(ImageSource.camera);
        if (mounted) {
          Navigator.of(context).pop();
        }
      },
    );

    Widget galleryButton = TextButton(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
      child: const Text(
        "相册",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      onPressed: () async {
        await selectFile(ImageSource.gallery);
        if (mounted) {
          Navigator.of(context).pop();
        }
      },
    );
    AlertDialog alert = AlertDialog(
      actions: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: cameraButton,
            ),
            const Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 2,
              child: galleryButton,
            ),
          ],
        ),
      ],
    );
    // 显示AlertDialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white10,
      body: SingleChildScrollView(
        reverse: true,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.95,
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
                child: _avatar != null
                    ? GestureDetector(
                        onTap: _chooseImage,
                        child: Image.file(File(_avatar!.path)),
                      )
                    : IconButton(
                        icon: const Icon(Icons.local_see),
                        iconSize: 60,
                        color: Colors.black,
                        onPressed: _chooseImage,
                      ),
              ),
              const SizedBox(
                height: 19,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "拍摄你的听汀头像",
                    style: TextStyle(fontSize: 21, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: 320,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          offset: const Offset(1, 1),
                          color: Colors.white.withOpacity(0.8))
                    ]),
                child: TextField(
                  controller: _nickName,
                  cursorColor: Colors.black54,
                  cursorHeight: 20,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                            color: Colors.white38,
                          )),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: "  请设置昵称",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                      fillColor: Colors.white),
                ),
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 80,
                        ),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Color(0xFFFFE57F)),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    if (_nickName.text == "") {
                                      Fluttertoast.showToast(msg: "昵称不可为空");
                                      return;
                                    }
                                    if (!await AuthService.register(
                                        widget.usr,
                                        widget.pwd,
                                        _nickName.text,
                                        widget.question,
                                        widget.ans)) return;
                                    var res = await AuthService.login(
                                        widget.usr, widget.pwd);
                                    if (res == null) {
                                      Fluttertoast.showToast(msg: "UK ERROR");
                                      return;
                                    }
                                    if (_avatar != null) {
                                      AuthService.updateImage(
                                          _avatar!, res["token"]);
                                    }
                                    Fluttertoast.showToast(msg: "注册成功");
                                    if (mounted) {
                                      Navigator.pushNamedAndRemoveUntil(
                                          context, "login", (route) => false);
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    textStyle: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 6),
                                  ),
                                  child: const Center(child: Text('完成注册')),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 80,
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: MediaQuery.of(context).viewInsets),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
