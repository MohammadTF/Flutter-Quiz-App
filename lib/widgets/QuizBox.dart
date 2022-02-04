import 'package:flutter/material.dart';
import 'package:udemy_assignment_1/pages/Result.dart';
import 'package:udemy_assignment_1/widgets/Answers.dart';
import '../widgets/Question.dart';
import '../models/quiz.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class QuizBox extends StatefulWidget {
  @override
  State<QuizBox> createState() => _QuizBoxState();
}

class _QuizBoxState extends State<QuizBox> {
  // const QuizBox({Key? key}) : super(key: key);
  List<Quiz> _questions = QuizModel().get();

  var qIndex = 0;
  var _totalScore = 0;

  List<String> _prepareAnswer(questionIndex) {
    List<String> answersList = _questions[questionIndex].incorrectAnswers;
    answersList.add(_questions[questionIndex].correctAnswer);
    answersList.shuffle();
    return answersList;
  }

  void _handleAnswerClick(answer) {
    setState(() {
      if (answer == _questions[qIndex].correctAnswer) {
        _totalScore += 2;
      }
      qIndex += 1;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    var url = Uri.https('opentdb.com', 'api.php', {"amount": '10'});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var jsonDecoded = jsonResponse['results'];
      _questions = List.from(jsonDecoded)
          .map<Quiz>((quiz) => Quiz.fromMap(quiz))
          .toList();

      print(jsonDecoded);
      // print('Number of books about http: $itemCount.');
    } else {
      // print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (qIndex < _questions.length)
          ? Column(
              children: [
                Question(_questions[qIndex].question),
                ..._prepareAnswer(qIndex)
                    .map((e) => Answers(() => {_handleAnswerClick(e)}, e))
                    .toList()
              ],
            )
          : Result(_totalScore),
    );
  }
}
