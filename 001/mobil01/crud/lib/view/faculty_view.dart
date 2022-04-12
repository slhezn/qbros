import 'package:crud/datas/faculty.dart';
import 'package:flutter/material.dart';

import '../common/widgets/search_and_list.dart';

class FacultyView extends StatelessWidget {
  const FacultyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SearchAndList(
      title: 'Fakülte / Sınıf Ara', map: FacultyData().facultyMap(context));
}
