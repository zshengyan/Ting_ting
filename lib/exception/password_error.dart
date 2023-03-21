import 'package:ting/exception/base.dart';

class PasswordErrorException extends BaseException {
  PasswordErrorException() {
    msg = "密码和原密码不匹配";
  }
}
