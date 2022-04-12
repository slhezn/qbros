import 'package:crud/datas/user.dart';
import 'package:crud/logic/login_view_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../datas/question.dart';

class QuestionViewLogic with ChangeNotifier {
  final List<Map<String, dynamic>> _questionData = QuestionData().questionMap;

  int _currentQuestion = 0;
  int get currentQuestion => _currentQuestion;

  set currentQuestion(int value) {
    _currentQuestion = value;
    notifyListeners();
  }

  int _currentButtonIndex = 2;
  int get currentButtonIndex => _currentButtonIndex;

  set currentButtonIndex(int value) {
    _currentButtonIndex = value;
    notifyListeners();
  }

  Color _optAColor = Colors.blue;
  Color optAColor(List<Map<String, dynamic>> questionData) {
    if (questionData[_currentQuestion]['answer'] == 'A' &&
        questionData[_currentQuestion]['answered'] != '') {
      _optAColor = Colors.green;
    } else if (questionData[_currentQuestion]['answered'] !=
            questionData[_currentQuestion]['answer'] &&
        questionData[_currentQuestion]['answered'] == 'A') {
      _optAColor = Colors.red;
    }
    return _optAColor;
  }

  void get colorizeAAsRed {
    _optAColor = Colors.red;
    notifyListeners();
  }

  void get colorizeAAsGreen {
    _optAColor = Colors.green;
    notifyListeners();
  }

  Color _optBColor = Colors.blue;
  Color optBColor(List<Map<String, dynamic>> questionData) {
    if (questionData[_currentQuestion]['answer'] == 'B' &&
        questionData[_currentQuestion]['answered'] != '') {
      _optBColor = Colors.green;
    } else if (questionData[_currentQuestion]['answered'] !=
            questionData[_currentQuestion]['answer'] &&
        questionData[_currentQuestion]['answered'] == 'B') {
      _optBColor = Colors.red;
    }
    return _optBColor;
  }

  void get colorizeBAsRed {
    _optBColor = Colors.red;
    notifyListeners();
  }

  void get colorizeBAsGreen {
    _optBColor = Colors.green;
    notifyListeners();
  }

  Color _optCColor = Colors.blue;
  Color optCColor(List<Map<String, dynamic>> questionData) {
    if (questionData[_currentQuestion]['answer'] == 'C' &&
        questionData[_currentQuestion]['answered'] != '') {
      _optCColor = Colors.green;
    } else if (questionData[_currentQuestion]['answered'] !=
            questionData[_currentQuestion]['answer'] &&
        questionData[_currentQuestion]['answered'] == 'C') {
      _optCColor = Colors.red;
    }
    return _optCColor;
  }

  void get colorizeCAsRed {
    _optCColor = Colors.red;
    notifyListeners();
  }

  void get colorizeCAsGreen {
    _optCColor = Colors.green;
    notifyListeners();
  }

  Color _optDColor = Colors.blue;
  Color optDColor(List<Map<String, dynamic>> questionData) {
    if (questionData[_currentQuestion]['answer'] == 'D' &&
        questionData[_currentQuestion]['answered'] != '') {
      _optDColor = Colors.green;
    } else if (questionData[_currentQuestion]['answered'] !=
            questionData[_currentQuestion]['answer'] &&
        questionData[_currentQuestion]['answered'] == 'D') {
      _optDColor = Colors.red;
    }
    return _optDColor;
  }

  void get colorizeDAsRed {
    _optDColor = Colors.red;
    notifyListeners();
  }

  void get colorizeDAsGreen {
    _optDColor = Colors.green;
    notifyListeners();
  }

  Color _optEColor = Colors.blue;
  Color optEColor(List<Map<String, dynamic>> questionData) {
    if (questionData[_currentQuestion]['answer'] == 'E' &&
        questionData[_currentQuestion]['answered'] != '') {
      _optEColor = Colors.green;
    } else if (questionData[_currentQuestion]['answered'] !=
            questionData[_currentQuestion]['answer'] &&
        questionData[_currentQuestion]['answered'] == 'E') {
      _optEColor = Colors.red;
    }
    return _optEColor;
  }

  void get colorizeEAsRed {
    _optEColor = Colors.red;
    notifyListeners();
  }

  void get colorizeEAsGreen {
    _optEColor = Colors.green;
    notifyListeners();
  }

  void get resetColorize {
    _optAColor = Colors.blue;
    _optBColor = Colors.blue;
    _optCColor = Colors.blue;
    _optDColor = Colors.blue;
    _optEColor = Colors.blue;
    notifyListeners();
  }

  void swA(List<Map<String, dynamic>> questionData) {
    if (questionData[_currentQuestion]['answer'] == 'A' &&
        questionData[_currentQuestion]['answered'] == 'A') {
      colorizeAAsGreen;
    } else if (questionData[_currentQuestion]['answer'] == 'B' &&
        questionData[_currentQuestion]['answered'] == 'A') {
      colorizeAAsRed;
      colorizeBAsGreen;
    } else if (questionData[_currentQuestion]['answer'] == 'C' &&
        questionData[_currentQuestion]['answered'] == 'A') {
      colorizeAAsRed;
      colorizeCAsGreen;
    } else if (questionData[_currentQuestion]['answer'] == 'D' &&
        questionData[_currentQuestion]['answered'] == 'A') {
      colorizeAAsRed;
      colorizeDAsGreen;
    } else if (questionData[_currentQuestion]['answer'] == 'E' &&
        questionData[_currentQuestion]['answered'] == 'A') {
      colorizeAAsRed;
      colorizeDAsGreen;
    }
  }

  void swB(List<Map<String, dynamic>> questionData) {
    switch (questionData[_currentQuestion]['answer']) {
      case 'A':
        colorizeAAsGreen;
        colorizeBAsRed;
        break;

      case 'B':
        colorizeBAsGreen;
        break;

      case 'C':
        colorizeBAsRed;
        colorizeCAsGreen;
        break;

      case 'D':
        colorizeBAsRed;
        colorizeDAsGreen;
        break;

      case 'E':
        colorizeBAsRed;
        colorizeEAsGreen;
        break;
    }
  }

  void swC(List<Map<String, dynamic>> questionData) {
    switch (questionData[_currentQuestion]['answer']) {
      case 'A':
        colorizeAAsGreen;
        colorizeCAsRed;
        break;

      case 'B':
        colorizeBAsGreen;
        colorizeCAsRed;
        break;

      case 'C':
        colorizeCAsGreen;
        break;

      case 'D':
        colorizeCAsRed;
        colorizeDAsGreen;
        break;

      case 'E':
        colorizeCAsRed;
        colorizeEAsGreen;
        break;
    }
  }

  void swD(List<Map<String, dynamic>> questionData) {
    switch (questionData[_currentQuestion]['answer']) {
      case 'A':
        colorizeAAsGreen;
        colorizeDAsRed;
        break;

      case 'B':
        colorizeBAsGreen;
        colorizeDAsRed;
        break;

      case 'C':
        colorizeCAsGreen;
        colorizeDAsRed;
        break;

      case 'D':
        colorizeDAsGreen;
        break;

      case 'E':
        colorizeDAsRed;
        colorizeEAsGreen;
        break;
    }
  }

  void swE(List<Map<String, dynamic>> questionData) {
    switch (questionData[_currentQuestion]['answer']) {
      case 'A':
        colorizeAAsGreen;
        colorizeEAsRed;
        break;

      case 'B':
        colorizeBAsGreen;
        colorizeEAsRed;
        break;

      case 'C':
        colorizeCAsGreen;
        colorizeEAsRed;
        break;

      case 'D':
        colorizeDAsGreen;
        colorizeEAsRed;
        break;

      case 'E':
        colorizeEAsGreen;
        break;
    }
  }

  void onTapA(BuildContext context) {
    if (_questionData[_currentQuestion]['answered'] == '') {
      context.read<QuestionData>().seen(_currentQuestion, 'A');
      swA(_questionData);
    }
  }

  void onTapB(BuildContext context) {
    if (_questionData[_currentQuestion]['answered'] == '') {
      context.read<QuestionData>().seen(_currentQuestion, 'B');
      swB(_questionData);
    }
  }

  void onTapC(BuildContext context) {
    if (_questionData[_currentQuestion]['answered'] == '') {
      context.read<QuestionData>().seen(_currentQuestion, 'C');
      swC(_questionData);
    }
  }

  void onTapD(BuildContext context) {
    if (_questionData[_currentQuestion]['answered'] == '') {
      context.read<QuestionData>().seen(_currentQuestion, 'D');
      swD(_questionData);
    }
  }

  void onTapE(BuildContext context) {
    if (_questionData[_currentQuestion]['answered'] == '') {
      context.read<QuestionData>().seen(_currentQuestion, 'E');
      swE(_questionData);
    }
  }

  void bottomBar(int value, BuildContext context) {
    final _questionData = QuestionData().filteredQuestionMap(context
            .read<UserData>()
            .userMapWithId(context.read<LoginViewLogic>().currentUserId!)[0]
        ['deleted']);
    final _userData =
        UserData().userMapWithId(_questionData[_currentQuestion]['userId']);

    final _currentUserData =
        UserData().userMapWithId(context.read<LoginViewLogic>().currentUserId!);

    _currentButtonIndex = value;
    resetColorize;
    switch (value) {
      case 0:
        if (_currentQuestion != 0) {
          _currentQuestion--;
        }
        print(
            '_currentUserData : $_currentUserData, _currentQuestion : $_currentQuestion');
        break;
      case 1:
        _showDialog(context);
        break;

      case 2:
        if (_questionData[currentQuestion]['answered'] == '') {
          QuestionData()
              .seen(_currentQuestion, _questionData[currentQuestion]['answer']);
        }
        break;

      case 3:
        _currentUserData[0]['deleted']
            .add(_questionData[currentQuestion]['questionId']);
        print(
            '_currentUserData : $_currentUserData, _currentQuestion : $_currentQuestion');
            _currentQuestion != 0 ? _currentQuestion-- : null;
        break;

      case 4:
        _nextQuestion(_questionData);
        print(
            '_currentUserData : $_currentUserData, _currentQuestion : $_currentQuestion');

        break;

      default:
    }
  }

  void _nextQuestion(List<Map<String, dynamic>> questionData) {
    resetColorize;
    if (_currentQuestion < questionData.length - 1) {
      _currentQuestion++;
    }
  }

  Future<dynamic> _showDialog(BuildContext context) {
    final List<Map<String, dynamic>> _userData =
        UserData().userMapWithId(_questionData[_currentQuestion]['userId']);

    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Bilgi'),
              content: Text(_userData[0]['username'].toString()),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Vazgeç'))
              ],
            ));
  }
}
