import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void startQuiz() {
      Navigator.pushNamed(context, "/quiz");
    }

    return Scaffold(
      backgroundColor: Colors.deepPurple[600],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/quiz-logo.png', width: 300),
            const SizedBox(height: 100),
            const Text("Learn Flutter the fun way!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                )),
            const SizedBox(height: 45),
            OutlinedButton(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                backgroundColor: Colors.white,
              ),
              child: Text("Start Quiz",
                  style: TextStyle(
                    color: Colors.deepPurple[600],
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
