import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../service/data_service.dart';
import '../view/lesson_view.dart';

class FacultyData {
  FacultyData._privateConstructor();
  static final FacultyData _instance = FacultyData._privateConstructor();
  factory FacultyData() => _instance;

  List<Map<String, dynamic>> facultyMap(BuildContext context) {
    final List<Map<String, dynamic>> _facultyMap = [
      {
        'name': 'İktisat',
        'link': const LessonView(),
      },
      {
        'name': 'Diş Hekimliği',
        'link': const LessonView(),
      },
      {
        'name': 'İşletme',
        'link': const LessonView(),
      },
      {
        'name': 'Mimarlık',
        'link': const LessonView(),
      },
    ]
        .where((element) => element['name']!
            .toString()
            .contains(context.watch<DataService>().query.toLowerCase()))
        .toList();
    return _facultyMap;
  }
}
