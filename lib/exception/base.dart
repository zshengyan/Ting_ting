import 'package:fluttertoast/fluttertoast.dart';

class BaseException implements Exception {
  String msg = "Unknown Exception";

  BaseException();

  void alert() {
    Fluttertoast.showToast(msg: msg);
  }
}
