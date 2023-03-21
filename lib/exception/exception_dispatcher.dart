import 'package:ting/exception/base_exception.dart';

class ExceptionDispatcher {
  static Map<int, BaseException> exceptionMap = {
    99999: BaseException(),
  };

  static BaseException dispatcher(int code) {
    return exceptionMap[code] ?? BaseException();
  }
}
