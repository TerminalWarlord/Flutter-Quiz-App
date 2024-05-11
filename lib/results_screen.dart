import 'package:flutter/material.dart';
import 'package:advance_basics/data/questions.dart';

import 'package:advance_basics/question_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.userAnswers, required this.restartQuiz});

  final List<String> userAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < questions.length; i++) {
      // print(userAnswers);
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'answer': questions[i].answers[0],
        'user_answer': userAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummary();
    final int totalQuestions = questions.length;
    final int correctAnswer = (summaryData.where((data) {
      return data['answer'] == data['user_answer'];
    })).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have answered $correctAnswer out of $totalQuestions questions correctly.',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 249, 214, 198),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(
              summary: getSummary(),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: restartQuiz,
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              label: const Text(
                'Restart',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
