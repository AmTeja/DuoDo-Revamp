import 'package:duodo/core/di/dependency_injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// [LocalStorageHelper] is a helper class to manage local storage operations.
/// It is a singleton class.
/// It uses the [SharedPreferences](https://pub.dev/packages/shared_preferences) package to store data locally.
class LocalStorageHelper {
  LocalStorageHelper._();

  static final _instance = LocalStorageHelper._();

  static LocalStorageHelper get I => _instance;

  /// [prefs] is the instance of [SharedPreferences] used to store data locally.
  late final SharedPreferences prefs = it.get<SharedPreferences>();

  /// [SetString] is a method to store a string value with a given [key].
  Future<void> setString(String key, String value) async {
    await prefs.setString(key, value);
  }

  /// [GetString] is a method to retrieve a string value with a given [key].
  String? getString(String key) {
    return prefs.getString(key);
  }

  /// [SetBool] is a method to store a boolean value with a given [key].
  Future<void> setBool(String key, bool value) async {
    await prefs.setBool(key, value);
  }

  /// [GetBool] is a method to retrieve a boolean value with a given [key].
  bool? getBool(String key) {
    return prefs.getBool(key);
  }

  /// [SetInt] is a method to store an integer value with a given [key].
  Future<void> setInt(String key, int value) async {
    await prefs.setInt(key, value);
  }

  /// [GetInt] is a method to retrieve an integer value with a given [key].
  int? getInt(String key) {
    return prefs.getInt(key);
  }

  /// [SetDouble] is a method to store a double value with a given [key].
  Future<void> setDouble(String key, double value) async {
    await prefs.setDouble(key, value);
  }

  /// [GetDouble] is a method to retrieve a double value with a given [key].
  double? getDouble(String key) {
    return prefs.getDouble(key);
  }

  /// [SetStringList] is a method to store a list of strings with a given [key].
  Future<void> setStringList(String key, List<String> value) async {
    await prefs.setStringList(key, value);
  }

  /// [GetStringList] is a method to retrieve a list of strings with a given [key].
  List<String>? getStringList(String key) {
    return prefs.getStringList(key);
  }

  /// [Remove] is a method to remove a value with a given [key].
  Future<void> remove(String key) async {
    await prefs.remove(key);
  }

  /// [Clear] is a method to clear all the stored values.
  Future<void> clear() async {
    await prefs.clear();
  }

  /// [ContainsKey] is a method to check if a value with a given [key] exists.
  bool containsKey(String key) {
    return prefs.containsKey(key);
  }

  /// [GetKeys] is a method to retrieve all the stored keys.
  Set<String> getKeys() {
    return prefs.getKeys();
  }
}
