import 'package:flutter/material.dart';
import './pages/Quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Quiz!.'),
        ),
        body: Quiz(),
      ),
    );
  }
}
