import 'package:ting/exception/base.dart';
import 'package:ting/exception/blocked.dart';
import 'package:ting/exception/invalid_error.dart';
import 'package:ting/exception/no_privileges.dart';
import 'package:ting/exception/password_error.dart';
import 'package:ting/exception/username_exist.dart';
import 'package:ting/exception/username_password_not_match.dart';
import 'package:ting/exception/wrong_security_answer.dart';

class ExceptionDispatcher {
  static Map<int, BaseException> exceptionMap = {
    20000: BaseException(),
    30000: NoPrivilegesException(),
    30001: BlockedException(),
    30003: UsernamePasswordNotMatchException(),
    30004: PasswordErrorException(),
    30005: WrongSecurityAnswer(),
    30006: UsernameExist(),
    50001: InvalidError(),
  };

  static BaseException dispatcher(int code) {
    return exceptionMap[code] ?? BaseException();
  }
}
