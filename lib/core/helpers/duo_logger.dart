import 'package:duodo/core/exceptions/duo_exception.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class Log {
  static final Log _instance = Log._internal();
  factory Log() => _instance;
  Log._internal();

  final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
    ),
  );

  void error(DuoException e) => {
        if (kDebugMode)
          _logger.e(
            e.errorMessage,
            stackTrace: e.stackTrace,
            error: e.e,
            time: DateTime.now(),
          )
      };

  void info(String message) =>
      {if (kDebugMode) _logger.i(message, time: DateTime.now())};

  void debug(String message) =>
      {if (kDebugMode) _logger.d(message, time: DateTime.now())};

  void warning(String message) =>
      {if (kDebugMode) _logger.w(message, time: DateTime.now())};

  void verbose(String message) =>
      {if (kDebugMode) _logger.t(message, time: DateTime.now())};

  void fatal(String message) =>
      {if (kDebugMode) _logger.f(message, time: DateTime.now())};
}
