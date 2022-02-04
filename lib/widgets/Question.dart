import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  // const Question({ Key? key }) : super(key: key);
  final String _quesionText;

  Question(this._quesionText);

  @override
  Widget build(BuildContext context) {
    return Text(_quesionText);
  }
}
