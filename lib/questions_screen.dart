import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.endQuiz, {super.key});

  final void Function() endQuiz;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: widget.endQuiz,
        ),
        backgroundColor: Colors.deepPurple[600],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.deepPurple[600],
      body: const Center(
        child: Text("Questions Screen",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
            )),
      ),
    );
  }
}
