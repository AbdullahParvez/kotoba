import 'package:flutter/material.dart';
import 'package:japanese_word_tokenizer/japanese_word_tokenizer.dart';

Flexible buildStyledText(String mainSentence, String compareText) {
  List<TextSpan> textSpans = [];

  List<String> words = mainSentence.split(compareText);


  // for  (final word in words){
  //   // tokenize(word);
  //   if (word.isNotEmpty){
  //     List<dynamic> tokens = tokenize(word);
  //     print(tokens);
  //   }
  // }



  // print(words);
  textSpans.add(
    TextSpan(
        text: words[0],
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        )),
  );
  textSpans.add(
    TextSpan(
      text: compareText,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.purple, // Set your desired color here
        fontWeight: FontWeight.bold,
        // You can apply other styles as needed
      ),
    ),
  );
  textSpans.add(
    TextSpan(
        text: words[1],
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        )),
  );

  return Flexible(
    fit: FlexFit.loose,
    child: RichText(
      softWrap: true,
      text: TextSpan(
        children: textSpans,
      ),
    ),
  );
}