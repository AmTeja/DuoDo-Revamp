extension StringExt on String {
  String get capitalize => "${this[0].toUpperCase()}${substring(1)}";
  String get woex => replaceFirst('Exception: ', '');
}
