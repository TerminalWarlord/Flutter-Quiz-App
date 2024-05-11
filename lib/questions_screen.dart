import 'package:flutter/material.dart';
import 'package:advance_basics/answer_button.dart';
import 'package:advance_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String selectedAnswer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var activeIndex = 0;
  void handleSelect(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      activeIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[activeIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 255, 229, 221),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ...currentQuestion.shuffleAnswers().map((answer) {
              return AnswerButton(
                buttonText: answer,
                onTap: () {
                  handleSelect(answer);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
