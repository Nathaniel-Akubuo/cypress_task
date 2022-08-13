import 'package:flutter/foundation.dart';

class LoggerService {
  late String _className;

  LoggerService(String className) {
    _className = className;
  }

  void log(Object? object, [String? methodName]) {
    if (methodName == null) {
      debugPrint('$_className $object');
    } else {
      debugPrint('$_className | $methodName: $object');
    }
  }
}
