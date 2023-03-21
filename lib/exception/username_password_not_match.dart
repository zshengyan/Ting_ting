import 'package:ting/exception/base.dart';

class UsernamePasswordNotMatchException extends BaseException {
  UsernamePasswordNotMatchException() {
    msg = "账号或密码不匹配";
  }
}
