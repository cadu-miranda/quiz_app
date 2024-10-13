import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 100),
          Text("Learn Flutter the fun way!",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 26,
              )),
          const SizedBox(height: 45),
          OutlinedButton.icon(
            onPressed: startQuiz,
            icon: Icon(Icons.arrow_right_alt, color: Colors.deepPurple[600]),
            iconAlignment: IconAlignment.end,
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              backgroundColor: Colors.white,
            ),
            label: Text("Start Quiz",
                style: TextStyle(
                  color: Colors.deepPurple[600],
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ],
      ),
    );
  }
}
