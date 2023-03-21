import 'package:ting/exception/base.dart';

class NoPrivilegesException extends BaseException {
  NoPrivilegesException() {
    msg = "没有权限";
  }
}
