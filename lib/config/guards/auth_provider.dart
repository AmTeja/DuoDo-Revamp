import 'package:duodo/config/cache_keys.dart';
import 'package:duodo/core/helpers/local_storage_helper.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider() {
    _init();
  }

  Future<void> _init() async {
    final isLocalUser = LocalStorageHelper.I.getBool(CacheKeys.isLocalUser);
    if (isLocalUser == null || !isLocalUser) {
      _isLoggedIn = false;
      _isGuest = false;
    } else {
      _isLoggedIn = !isLocalUser;
      _isGuest = isLocalUser;
    }
  }

  bool _isLoggedIn = false;
  bool _isGuest = false;

  bool get isLoggedIn => _isLoggedIn;
  bool get isGuest => _isGuest;

  void login() {
    _isLoggedIn = true;
    _isGuest = false;
    notifyListeners();
  }

  Future<void> logout() async {
    _isLoggedIn = false;
    _isGuest = false;

    await LocalStorageHelper.I.setBool(CacheKeys.isLocalUser, false);
    notifyListeners();
  }

  Future<void> guest() async {
    _isLoggedIn = false;
    _isGuest = true;

    await LocalStorageHelper.I.setBool(CacheKeys.isLocalUser, true);

    notifyListeners();
  }

  Future<void> reset() async {
    _isLoggedIn = false;
    _isGuest = false;

    await LocalStorageHelper.I.setBool(CacheKeys.isLocalUser, false);
    notifyListeners();
  }
}
