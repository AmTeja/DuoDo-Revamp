class DuoException implements Exception {
  final String? message;
  final Exception e;
  final StackTrace? stackTrace;

  DuoException(this.e, {this.message, this.stackTrace});

  @override
  String toString() {
    return message ?? e.toString();
  }

  String get errorMessage =>
      message ?? e.toString().replaceFirst('Exception: ', '');

  String get errorType => e.runtimeType.toString();
}
