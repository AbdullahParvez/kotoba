import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.questions});
  final List<Map<String, dynamic>> questions;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: questions.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Colors.blueGrey,
                  )),
              color: Colors.greenAccent[50],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: buildResultColumn(index),
              ),
            ),
          ],
        );
      },
    );
  }

  Column buildResultColumn(int index) {
    var question = questions[index]['question'];
    var options = questions[index]['options'];
    var givenAnswer = questions[index]['givenAnswer'];
    var correctAnswer = questions[index]['correctAnswer'];

    Text questionText = Text(
      question,
      style: const TextStyle(
        fontSize: 30,
      ),
    );
    int optionCount = 1;
    String optionString = '';
    for (var option in options){
      optionString = '$optionString ${optionCount.toString()}. $option \n';
      optionCount++;
    }
    Text optionText = Text(
      // 'Option(${options.join(',  ')})',
      optionString,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.blue,
      ),
    );

    Text correctAnswerText = Text(
      'Correct Answer : $correctAnswer',
      style: const TextStyle(
        fontSize: 20,
        color: Colors.green,
      ),
    );

    Text givenAnswerText;
    if (givenAnswer == correctAnswer) {
      givenAnswerText = Text(
        'Selected Answer : $givenAnswer',
        style: const TextStyle(
          fontSize: 20,
          color: Colors.green,
        ),
      );
    } else {
      givenAnswerText = Text(
        'Selected Answer : $givenAnswer',
        style: const TextStyle(
          fontSize: 20,
          color: Colors.red,
        ),
      );
    }

    if (givenAnswer == correctAnswer) {
      return Column(
        children: [
          questionText,
          optionText,
          givenAnswerText,
        ],
      );
    } else {
      return Column(
        children: [
          questionText,
          optionText,
          givenAnswerText,
          correctAnswerText,
        ],
      );
    }
  }
}
