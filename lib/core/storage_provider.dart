import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/user/user.dart';
import 'constants.dart';

class StorageProvider {
  final SharedPreferences _sharedPreferences;

  StorageProvider(this._sharedPreferences);



  void setUserEmail(String userEmail) {
    _sharedPreferences.setString(userEmail, userEmail);
  }

  String getUserEmail() {
    return _sharedPreferences.getString(userEmail) ?? '';
  }

  void setUserPassword(String userPassword) {
    _sharedPreferences.setString(userPassword, userPassword);
  }

  String getUserPassword() {
    return _sharedPreferences.getString(userPassword) ?? '';
  }

  void setUserAuth(User userAuth) {
    String jsonString = jsonEncode(userAuth.toJson());
    _sharedPreferences.setString(appCurrentUserAuth, jsonString);
  }


  User? getUserAuth() {
    if (_sharedPreferences.getString(appCurrentUserAuth) != null) {
      return User.fromJson(jsonDecode(
          _sharedPreferences.getString(appCurrentUserAuth) ?? ""));
    } else {
      return null;
    }
  }

  Future<bool> removeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isFirstLogin, true);
    return await prefs.remove(appCurrentUserAuth);
  }


}
