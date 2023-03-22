import 'package:ting/exception/base.dart';

class UserNotExist extends BaseException {
  UserNotExist() {
    msg = "用户名不存在";
  }
}
