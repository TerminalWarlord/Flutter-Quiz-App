import 'package:flutter/material.dart';
import 'package:advance_basics/start_screen.dart';
import 'package:advance_basics/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  int activeScreen = 0;

  void startQuiz() {
    setState(() {
      activeScreen = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
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
          child: activeScreen == 0
              ? StartScreen(startQuiz)
              : const QuestionsScreen(),
        ),
      ),
    );
  }
}
