import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  SharedPreferencesUtil._();

  static SharedPreferences? _prefs;

  static get prefs => _prefs;

  static Future<void> init() async {
    // Obtain shared preferences.
    _prefs = await SharedPreferences.getInstance();
  }

  /// get string.
  static Future<String> getString(String key, {String defValue = ''}) async {
    final String? value = _prefs?.getString(key);
    return value ?? defValue;
  }

  /// put string.
  static Future<void> setString(String key, String value) async {
    // Save an string value to key.
    await _prefs?.setString(key, value);
  }

  /// get int.
  static Future<int> getInt(String key, {int defValue = -1}) async {
    // Get the integer value from key.
    final int? value = _prefs?.getInt(key);
    return value ?? defValue;
  }

  /// set int.
  static Future<void> setInt(String key, int value) async {
    // Save an integer value to key.
    await _prefs?.setInt(key, value);
  }

  /// get double.
  static Future<double> getDouble(String key, {double defValue = -1.0}) async {
    // Get the double value from key.
    final double? value = _prefs?.getDouble(key);
    return value ?? defValue;
  }

  /// set double.
  static Future<void> setDouble(String key, double value) async {
    // Save an double value to key.
    await _prefs?.setDouble(key, value);
  }

  /// get bool.
  static Future<bool> getBool(String key, {bool defValue = false}) async {
    // Get the boolean value from key.
    final bool? value = _prefs?.getBool(key);
    return value ?? defValue;
  }

  /// set bool.
  static Future<void> setBool(String key, bool value) async {
    // Save an boolean value to key.
    await _prefs?.setBool(key, value);
  }

  /// Delete string.
  static Future<void> deleteKey(String key) async {
    // Delete a key.
    await _prefs?.remove(key);
  }

  /// clear.
  static Future<void> clear() async {
    // Clear all.
    await _prefs?.clear();
  }
}
