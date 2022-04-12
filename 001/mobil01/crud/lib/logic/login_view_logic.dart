import 'package:crud/datas/user.dart';
import 'package:flutter/material.dart';

class LoginViewLogic with ChangeNotifier {
  String? _username;
  String? get username => _username;

  set username(String? value) {
    _username = value;
    notifyListeners();
  }

  int? _currentUserId;
 int? get currentUserId => _currentUserId;

 set currentUserId(int? value) {
   _currentUserId = value;
   notifyListeners();
 }

  bool findUser(String mail, String password) {
    bool result = false;
    for (var user in UserData().userMap) {
      if (user['username'] == mail && user['password'] == password) {
        _username = mail;
        _currentUserId = user['userId'];
        result = true;
        notifyListeners();
      }
    }
    return result;
  }
}
