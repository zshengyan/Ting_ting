import 'package:ting/exception/base.dart';

class UsernameExist extends BaseException {
  UsernameExist() {
    msg = "用户名已存在";
  }
}
