import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../service/data_service.dart';
import '../view/question_view.dart';

class LessonData {
  LessonData._privateConstructor();
  static final LessonData _instance = LessonData._privateConstructor();
  factory LessonData() => _instance;

  List<Map<String, dynamic>> lessonMap(BuildContext context) {
    final List<Map<String, dynamic>> _lessonMap = [
      {
        'name': 'İktisata Giriş',
        'link': const QuestionView(title: 'İktisata Giriş'),
      },
      {
        'name': 'Ekonometri',
        'link': const QuestionView(title: 'Ekonometri'),
      },
      {
        'name': 'İşletme',
        'link': const QuestionView(title: 'İşletme'),
      },
      {
        'name': 'Finansal Okur Yazarlık',
        'link': const QuestionView(title: 'Finansal Okur Yazarlık'),
      },
    ]
        .where((element) => element['name']!
            .toString()
            .contains(context.watch<DataService>().query.toLowerCase()))
        .toList();
    return _lessonMap;
  }
}
