import 'package:crud/service/data_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view/faculty_view.dart';

class SchollData {
  SchollData._privateConstructor();
  static final SchollData _instance = SchollData._privateConstructor();
  factory SchollData() => _instance;

  List<Map<String, dynamic>> schollMap(BuildContext context) {
    final List<Map<String, dynamic>> _schollMap = [
      {
        'name': 'İstanbul Üniversitesi',
        'link': const FacultyView(),
      },
      {
        'name': 'Ege Üniversitesi',
        'link': const FacultyView(),
      },
      {
        'name': 'Marmara Üniversitesi',
        'link': const FacultyView(),
      },
      {
        'name': 'Karadeniz Üniversitesi',
        'link': const FacultyView(),
      },
      {
        'name': 'Eskişehir Üniversitesi',
        'link': const FacultyView(),
      },
      {
        'name': 'Ortadoğu Teknik Üniversitesi',
        'link': const FacultyView(),
      },
      {
        'name': 'Boğaziçi Üniversitesi',
        'link': const FacultyView(),
      },
      {
        'name': 'Sakarya Üniversitesi',
        'link': const FacultyView(),
      },
      {
        'name': 'Konya Teknik Üniversitesi',
        'link': const FacultyView(),
      },
      {
        'name': 'İstanbul Teknik Üniversitesi',
        'link': const FacultyView(),
      },
      {
        'name': 'Atatürk Üniversitesi',
        'link': const FacultyView(),
      },
    ]
        .where((element) => element['name']!
            .toString()
            .contains(context.watch<DataService>().query.toLowerCase()))
        .toList();
    return _schollMap;
  }
}
