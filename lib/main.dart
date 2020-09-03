import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": 'What\'s your favorite colors?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 5},
        {'text': 'Yellow', 'score': 2},
      ]
    },
    {
      "questionText": 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Tiger', 'score': 10},
        {'text': 'Cheeta', 'score': 5},
        {'text': 'Loin', 'score': 2},
      ]
    },
    {
      "questionText": 'What\'s your favorite city?',
      'answers': [
        {'text': 'New York', 'score': 10},
        {'text': 'Sacramento', 'score': 5},
        {'text': 'LoinSan Fransisco', 'score': 2},
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('My Survey App!'),
            ),
            body: _questionIndex < _questions.length
                ? Quiz(
                    answerQuestion: _answerQuestion,
                    questions: _questions,
                    questionIndex: _questionIndex)
                : Result(_totalScore, _resetQuiz)));
  }
}
