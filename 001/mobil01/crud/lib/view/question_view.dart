import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/widgets/opt_container.dart';
import '../datas/question.dart';
import '../datas/user.dart';
import '../logic/login_view_logic.dart';
import '../logic/question_view_logic.dart';

class QuestionView extends StatefulWidget {
  const QuestionView({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  @override
  Widget build(BuildContext context) {
    final _watchLogic = context.watch<QuestionViewLogic>();
    final _readLogic = context.read<QuestionViewLogic>();

    return Scaffold(
        appBar: _appBar,
        bottomNavigationBar: _bottomNavigationBar(_watchLogic, _readLogic),
        body: _body(context));
  }

  Padding _body(BuildContext context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
          child: Column(children: _columnElements(context))));

  BottomNavigationBar _bottomNavigationBar(
          QuestionViewLogic _watchLogic, QuestionViewLogic _readLogic) =>
      BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _watchLogic.currentButtonIndex,
          items: _bottomBarItems,
          onTap: (value) => _readLogic.bottomBar(value, context));

  AppBar get _appBar => AppBar(
        title: Center(child: Text(widget.title)),
        actions: [
          Center(child: Text(context.read<LoginViewLogic>().username!)),
          const SizedBox(width: 10),
          Center(
              child: Text(
                  context.read<LoginViewLogic>().currentUserId!.toString())),
        ],
      );

  List<BottomNavigationBarItem> get _bottomBarItems => const [
        BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back_ios_new), label: 'Önceki'),
        BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Bilgi'),
        BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Cevap?'),
        BottomNavigationBarItem(
            icon: Icon(Icons.delete_forever), label: 'Bunu Sil'),
        BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward_ios), label: 'Sonraki')
      ];

  List<Widget> _columnElements(BuildContext context) {
    final _questionData = QuestionData().filteredQuestionMap(context
            .read<UserData>()
            .userMapWithId(context.read<LoginViewLogic>().currentUserId!)[0]
        ['deleted']);
    if (_questionData.isNotEmpty) {
      final _readLogic = context.read<QuestionViewLogic>();
      final String _optA = _questionData[_readLogic.currentQuestion]['opt_A'];
      final String _optB = _questionData[_readLogic.currentQuestion]['opt_B'];
      final String _optC = _questionData[_readLogic.currentQuestion]['opt_C'];
      final String _optD = _questionData[_readLogic.currentQuestion]['opt_D'];
      final String _optE = _questionData[_readLogic.currentQuestion]['opt_E'];
      return [
        Card(
            color: const Color.fromARGB(255, 189, 22, 78),
            child: Text(_questionData[_readLogic.currentQuestion]['question'],
                style: _textStyle)),
        OptContainer(
            onTap: () => _readLogic.onTapA(context),
            color: _readLogic.optAColor(_questionData),
            opt: _optA),
        OptContainer(
            onTap: () => _readLogic.onTapB(context),
            color: _readLogic.optBColor(_questionData),
            opt: _optB),
        OptContainer(
            onTap: () => _readLogic.onTapC(context),
            color: _readLogic.optCColor(_questionData),
            opt: _optC),
        OptContainer(
            onTap: () => _readLogic.onTapD(context),
            color: _readLogic.optDColor(_questionData),
            opt: _optD),
        OptContainer(
            onTap: () => _readLogic.onTapE(context),
            color: _readLogic.optEColor(_questionData),
            opt: _optE)
      ];
    } else {
      return [
        const Center(child: Text('Bu konuya ait ya soru yok. Ya da hepsini sildiniz.'))
      ];
    }
  }

  TextStyle get _textStyle =>
      const TextStyle(color: Colors.white, fontSize: 20);
}
