import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/screens/results_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';

enum ActiveScreen { home, questions, results }

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  ActiveScreen activeScreen = ActiveScreen.home;

  void startQuiz() {
    setState(() {
      activeScreen = ActiveScreen.questions;
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ActiveScreen.results;
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];

      activeScreen = ActiveScreen.home;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(startQuiz);

    if (activeScreen == ActiveScreen.questions) {
      screenWidget = QuestionsScreen(
        chooseAnswer: chooseAnswer,
      );
    } else if (activeScreen == ActiveScreen.results) {
      screenWidget = ResultsScreen(selectedAnswers, restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: screenWidget,
        ),
      ),
    );
  }
}
