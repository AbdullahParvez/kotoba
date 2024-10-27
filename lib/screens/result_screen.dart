import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../widgets/word_details.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.questions, required this.testNo});
  final List<Map<String, dynamic>> questions;
  final int testNo;
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
                ),
              ),
              color: Colors.greenAccent[50],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: buildResultColumn(index, context),
              ),
            ),
          ],
        );
      },
    );
  }

  Column buildResultColumn(int index, BuildContext context) {
    var question = questions[index]['question'];
    var options = questions[index]['options'];
    var givenAnswer = questions[index]['givenAnswer'];
    var correctAnswer = questions[index]['correctAnswer'];

    List<RichText> optionsWidget = [];

    Text questionText = Text(
      question,
      style: const TextStyle(
        fontSize: 24,
        color: Colors.blueGrey,
      ),
    );

    RichText questionTextJpn = RichText(
      text: TextSpan(
        text: question,
        style: const TextStyle(
          fontSize: 24,
          color: Colors.blueGrey,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            showDialog(
              context: context,
              builder: (context) => WordDetails(
                vocab: question,
              ),
            );
          },
      ),
    );

    int optionCount = 1;

    for (var option in options) {
      List<InlineSpan> textSpans = [];
      TextSpan tempCountSpan = TextSpan(
        text: '$optionCount. ',
        style: TextStyle(
          fontSize: 16,
          color: Colors.blue[800],
        ),
      );
      textSpans.add(tempCountSpan);

      TextSpan tempTextSpan;
      if ([1, 2, 5, 6].contains(testNo)) {
        tempTextSpan = TextSpan(
          text: option,
          style: TextStyle(
            fontSize: 16,
            color: Colors.blue[800],
          ),
        );
      } else {
        tempTextSpan = TextSpan(
          text: option,
          style: TextStyle(
            fontSize: 16,
            color: Colors.blue[800],
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              showDialog(
                context: context,
                builder: (context) => WordDetails(
                  vocab: option + '\n',
                ),
              );
            },
        );
      }
      textSpans.add(tempTextSpan);

      optionsWidget.add(
        RichText(
          text: TextSpan(
            children: textSpans,
          ),
        ),
      );
      optionCount++;
    }
    Text correctAnswerText = Text(
      'Correct Answer : $correctAnswer',
      style: TextStyle(
        fontSize: 20,
        color: Colors.green[900],
      ),
    );

    Text givenAnswerText;
    if (givenAnswer == correctAnswer) {
      givenAnswerText = Text(
        'Selected Answer : $givenAnswer',
        style: TextStyle(
          fontSize: 20,
          color: Colors.green[900],
        ),
      );
    } else {
      givenAnswerText = Text(
        'Selected Answer : $givenAnswer',
        style: TextStyle(
          fontSize: 20,
          color: Colors.red[900],
        ),
      );
    }

    return Column(
      children: [
        if ([1, 2, 5, 6].contains(testNo)) questionTextJpn,
        if ([3, 4, 7, 8].contains(testNo)) questionText,
        ...optionsWidget,
        givenAnswerText,
        if (givenAnswer != correctAnswer) correctAnswerText
      ],
    );
  }
}
