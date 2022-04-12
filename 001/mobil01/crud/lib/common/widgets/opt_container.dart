import 'package:flutter/material.dart';

class OptContainer extends StatelessWidget {
  const OptContainer(
      {Key? key, required this.onTap, required this.color, required this.opt})
      : super(key: key);

  final void Function() onTap;
  final Color color;
  final String opt;

  @override
  Widget build(BuildContext context) =>
      GestureDetector(onTap: onTap, child: _container(context));

  Container _container(BuildContext context) => Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10),
      decoration: _boxDecoration,
      child: Center(child: Text(opt, style: _textStyle)));

  BoxDecoration get _boxDecoration =>
      BoxDecoration(borderRadius: BorderRadius.circular(20), color: color);

  TextStyle get _textStyle =>
      const TextStyle(color: Colors.white, fontSize: 20);
}
