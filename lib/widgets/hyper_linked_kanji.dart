import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HyperlinkedKanji extends StatefulWidget {
  final String word;
  final List<String> kanjiList;
  final Function onClick;

  const HyperlinkedKanji({
    super.key,
    required this.word,
    required this.kanjiList, required this.onClick
  });

  @override
  State<HyperlinkedKanji> createState() => _HyperlinkedKanjiState();
}

class _HyperlinkedKanjiState extends State<HyperlinkedKanji> {
  TextSpan createTextSpan(String text) {


    if (widget.kanjiList.contains(text)) {
      return TextSpan(
        text: text,
        style: const TextStyle(
          color: Colors.blue,
          fontSize: 40,
        ),
        recognizer: TapGestureRecognizer()
        ..onTap = () => widget.onClick(text),
      );
    } else {
      return TextSpan(
        text: text,
        style: const TextStyle(
          color: Colors.black, // Set your hyperlink color here
          fontSize: 40,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Split the input text into words
    final words = widget.word.split('');

    // Create a list of TextSpan widgets for each word
    final textSpans = words.map((word) => createTextSpan(word)).toList();

    return RichText(
      text: TextSpan(
        children: textSpans,
      ),
    );
  }
}