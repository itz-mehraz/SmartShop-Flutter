// lib/providers/auth_provider.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  static const LOGGED_IN_KEY = "logged_in_key";
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  AuthProvider() {
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool(LOGGED_IN_KEY) ?? false;
    notifyListeners();
  }

  Future<void> login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = true;
    await prefs.setBool(LOGGED_IN_KEY, true);
    notifyListeners();
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = false;
    await prefs.setBool(LOGGED_IN_KEY, false);
    // Also clear other user-specific data if needed
    notifyListeners();
  }
}