import 'package:ting/exception/base.dart';

class InvalidError extends BaseException {
  InvalidError() {
    msg = "服务器内部错误";
  }
}
