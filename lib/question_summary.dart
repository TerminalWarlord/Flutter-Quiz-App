import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summary});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    Color correctColor = const Color.fromARGB(255, 45, 216, 216);
    Color incorrectColor = const Color.fromARGB(255, 228, 32, 215);
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map(
            (data) {
              Color serialColor = (data['answer'] == data['user_answer']
                  ? correctColor
                  : incorrectColor);
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: serialColor,
                        border: Border.all(
                          color: serialColor,
                          width: 10,
                        )),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: GoogleFonts.lato(
                        color: const Color.fromARGB(255, 85, 85, 85),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'] as String,
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            data['user_answer'] as String,
                            style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 95, 48, 34),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            data['answer'] as String,
                            style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 19, 7, 3),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
