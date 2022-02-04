import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  // const Answers({ Key? key }) : super(key: key);

  final VoidCallback _handleAnswer;
  final String _answerText;

  Answers(this._handleAnswer, this._answerText);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _handleAnswer,
      child: Text(_answerText),
    );
  }
}
