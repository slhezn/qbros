import 'package:flutter/material.dart';

import '../common/widgets/search_and_list.dart';
import '../datas/scholl.dart';

class SchollView extends StatelessWidget {
  const SchollView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      SearchAndList(title: 'Okul Ara', map: SchollData().schollMap(context));
}
