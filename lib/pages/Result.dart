import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  // const Result({ Key? key }) : super(key: key);
  final int _totalScore;
  Result(this._totalScore);
  String get lastMsg {
    if (_totalScore > 10) {
      return 'You are awesome $_totalScore';
    } else {
      return 'Better luck next time. $_totalScore';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(lastMsg);
  }
}
