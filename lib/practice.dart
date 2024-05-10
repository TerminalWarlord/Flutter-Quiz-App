import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepOrange,
                Color.fromRGBO(255, 110, 64, 1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/quiz-logo.png',
                  width: 200,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Learn  Flutter the fun way!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 221, 39, 39),
                  ),
                  child: const Text(
                    'Start Quiz',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                // TextButton(
                //   onPressed: () {},
                //   child: const Text(
                //     'Start Quiz',
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 18,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
