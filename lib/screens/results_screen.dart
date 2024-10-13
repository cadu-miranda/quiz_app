import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.selectedAnswers, this.restartQuiz, {super.key});

  final List<String> selectedAnswers;

  final Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "question_text": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": selectedAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> summaryData = getSummaryData();

    final int totalQuestions = questions.length;

    final int totalCorrectAnswers = summaryData.where((data) {
      return data["user_answer"] == data["correct_answer"];
    }).length;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "You answered $totalCorrectAnswers out of $totalQuestions questions correctly.",
              style: GoogleFonts.lato(fontSize: 28, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 32,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton.icon(
              onPressed: restartQuiz,
              label: const Text(
                "Restart",
                style: TextStyle(fontSize: 26),
              ),
              icon: const Icon(
                Icons.restart_alt,
                size: 30,
              ),
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(8)),
            )
          ],
        ),
      ),
    );
  }
}
