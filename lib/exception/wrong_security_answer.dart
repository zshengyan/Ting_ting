import 'package:ting/exception/base.dart';

class WrongSecurityAnswer extends BaseException {
  WrongSecurityAnswer() {
    msg = "安全问题不匹配";
  }
}
