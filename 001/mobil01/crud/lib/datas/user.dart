import 'package:flutter/material.dart';

class UserData with ChangeNotifier {
  UserData._privateConstructor();
  static final UserData _instance = UserData._privateConstructor();
  factory UserData() => _instance;

  final List<Map<String, dynamic>> _userMap = [
    {'userId': 1, 'username': 'salih', 'password': '123456', 'deleted': []},
    {'userId': 2, 'username': 'anonim', 'password': '123456', 'deleted': []},
  ];

  List<Map<String, dynamic>> userMapWithId(int id) =>
      _userMap.where((element) => element['userId'] == id).toList();

  List<Map<String, dynamic>> get userMap => _userMap;
}
