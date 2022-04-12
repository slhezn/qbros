import 'dart:math';

import 'package:crud/datas/user.dart';
import 'package:crud/logic/login_view_logic.dart';
import 'package:crud/view/login_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:provider/provider.dart';

import 'common/widgets/search_and_list.dart';
import 'datas/lesson.dart';
import 'datas/question.dart';
import 'logic/question_view_logic.dart';
import 'service/data_service.dart';
import 'view/scholl_view.dart';

void main() {
  // TODO User bağla
  // TODO resimli soru olacak mı karar ver
  // TODO Soru sayfasını güzelleştir.

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataService()),
        ChangeNotifierProvider(create: (context) => QuestionViewLogic()),
        ChangeNotifierProvider(create: (context) => QuestionData()),
        ChangeNotifierProvider(create: (context) => LoginViewLogic()),
        ChangeNotifierProvider(create: (context) => UserData()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _homeLinks = [
    {
      'background':
          'https://cdn.pixabay.com/photo/2017/02/09/16/59/student-2052868_960_720.jpg',
      'name': 'Üniversiteler',
      'link': const SchollView()
    },
    {
      'background':
          'https://cdn.pixabay.com/photo/2014/11/03/17/58/read-515531_960_720.jpg',
      'name': 'Liseler',
      'link': const SchollView()
    },
    {
      'background':
          'https://cdn.pixabay.com/photo/2016/04/16/04/07/elementary-school-1332472_960_720.jpg',
      'name': 'İlk Okul ve Orta Okullar',
      'link': const SchollView()
    },
    {
      'background':
          'https://cdn.pixabay.com/photo/2017/05/26/11/10/language-2345801_960_720.jpg',
      'name': 'Yabancı Diller',
      'link': const SchollView()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('DERS ARA'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          separatorBuilder: (context, index) =>
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          itemCount: _homeLinks.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => _homeLinks[index]['link'],
              ),
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(
                      _homeLinks[index]['background'],
                    ),
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      _homeLinks[index]['name'],
                      style: ThemeData.light().textTheme.headline3!.copyWith(
                            color: Colors.white,
                            fontSize: 25,
                            backgroundColor:
                                const Color.fromARGB(255, 189, 22, 78),
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Lessons extends StatefulWidget {
  const Lessons({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Lessons> createState() => _LessonsState();
}

class _LessonsState extends State<Lessons> {
  @override
  Widget build(BuildContext context) =>
      SearchAndList(title: widget.title, map: LessonData().lessonMap(context));
}

class Cruds extends StatefulWidget {
  const Cruds({Key? key}) : super(key: key);

  @override
  State<Cruds> createState() => _CrudsState();
}

class _CrudsState extends State<Cruds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => postCrud(),
                ),
                IconButton(
                  icon: const Icon(Icons.update),
                  onPressed: () => putCrud(),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => deleteCrud(),
                ),
              ],
            ),
            FutureBuilder<dynamic>(
              future: getCrud(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var _data = snapshot.data![index];
                      return ExpansionTile(
                        title: Text(
                          _data['question'],
                        ),
                        children: [
                          Text('A - ${_data['opt_A']}'),
                          Text('B - ${_data['opt_B']}'),
                          Text('C - ${_data['opt_C']}'),
                          Text('D - ${_data['opt_D']}'),
                          Text('E - ${_data['opt_E']}'),
                          Text('Cevap - ${_data['answer']}'),
                        ],
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  final List<dynamic> _list = [];

  final _dio = Dio();

  getCrud() async {
    var response =
        await _dio.get('https://sezinapps.pythonanywhere.com/api/questions');
    for (var item in response.data) {
      _list.add(item);
    }

    return _list;
  }

  postCrud() async {
    await _dio.post('https://sezinapps.pythonanywhere.com/api/question', data: {
      'question': lorem(words: Random().nextInt(15)),
      'opt_A': lorem(words: Random().nextInt(5)),
      'opt_B': lorem(words: Random().nextInt(5)),
      'opt_C': lorem(words: Random().nextInt(5)),
      'opt_D': lorem(words: Random().nextInt(5)),
      'opt_E': lorem(words: Random().nextInt(5)),
      'answer': lorem(words: Random().nextInt(2)),
      'user_id': Random().nextInt(300),
      'lesson_id': Random().nextInt(200),
      'questionId': null
    });
  }

  putCrud() async {
    await _dio
        .put('https://sezinapps.pythonanywhere.com/api/question/4', data: {
      'question': lorem(words: Random().nextInt(15)),
      'opt_A': lorem(words: Random().nextInt(5)),
      'opt_B': lorem(words: Random().nextInt(5)),
      'opt_C': lorem(words: Random().nextInt(5)),
      'opt_D': lorem(words: Random().nextInt(5)),
      'opt_E': lorem(words: Random().nextInt(5)),
      'answer': lorem(words: Random().nextInt(2)),
      'user_id': Random().nextInt(300),
      'lesson_id': Random().nextInt(200),
      'questionId': null
    });
  }

  deleteCrud() async {
    await _dio.delete('https://sezinapps.pythonanywhere.com/api/question/2');
  }
}
