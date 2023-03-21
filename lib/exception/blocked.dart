import 'package:ting/exception/base.dart';

class BlockedException extends BaseException {
  BlockedException() {
    msg = "账号呗禁止登录";
  }
}
