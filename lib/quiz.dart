import 'package:flutter/material.dart';
import 'package:advance_basics/start_screen.dart';
import 'package:advance_basics/questions_screen.dart';
import 'package:advance_basics/data/questions.dart';
import 'package:advance_basics/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> userAnswers = [];
  String activeScreen = 'start-screen';

  void startQuiz() {
    setState(() {
      if (activeScreen == 'results-screen') {
        userAnswers = [];
      }
      activeScreen = 'question-screen';
    });
  }

  void selectAnswer(String selectedAnswer) {
    userAnswers.add(selectedAnswer);

    if (userAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = StartScreen(startQuiz);
    if (activeScreen == 'question-screen') {
      currentScreen = QuestionsScreen(
        onSelectAnswer: selectAnswer,
      );
    }
    if (activeScreen == 'results-screen') {
      currentScreen = ResultsScreen(
        userAnswers: userAnswers,
        restartQuiz: startQuiz,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepOrange,
                Color.fromARGB(255, 250, 90, 42),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}
