import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPref {
  read(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return jsonDecode(prefs.getString(key));
  }

  save(String key, value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(value));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
