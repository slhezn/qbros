import 'package:flutter/material.dart';

import '../common/widgets/search_and_list.dart';
import '../datas/lesson.dart';

class LessonView extends StatelessWidget {
  const LessonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SearchAndList(
      title: 'Ders Ara', map: LessonData().lessonMap(context));
}
