import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:japanese_word_tokenizer/japanese_word_tokenizer.dart';
import 'package:kotoba/widgets/word_details.dart';

class StyledTextWidget extends StatelessWidget {
  final String mainSentence;
  final String compareText;
  final Map<String, dynamic>? stokens;

  const StyledTextWidget({
    super.key,
    required this.mainSentence,
    required this.compareText, this.stokens,
  });

  @override
  Widget build(BuildContext context) {
    List<InlineSpan> textSpans = [];

    List<dynamic> tokens = tokenize(mainSentence);
    // print(tokens);
    stokens?.keys.forEach((key){
      final isMatch = key == compareText;

      textSpans.add(
        TextSpan(
          text: key.toString(), // Ensure `token` is converted to string here
          style: TextStyle(
            fontSize: 16,
            color: isMatch ? Colors.purple : Colors.black,
            fontWeight: isMatch ? FontWeight.bold : FontWeight.normal,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              showDialog(
                context: context,
                builder: (context) => WordDetails(
                  vocab: key,
                ),
              );
            },
        ),
      );
    },);

    // for (var token in tokens) {
    //   final isMatch = token == compareText;
    //
    //   textSpans.add(
    //     TextSpan(
    //       text: token.toString(), // Ensure `token` is converted to string here
    //       style: TextStyle(
    //         fontSize: 16,
    //         color: isMatch ? Colors.purple : Colors.black,
    //         fontWeight: isMatch ? FontWeight.bold : FontWeight.normal,
    //       ),
    //       recognizer: TapGestureRecognizer()
    //         ..onTap = () {
    //           showDialog(
    //             context: context,
    //             builder: (context) => WordDetails(
    //               vocab: token,
    //             ),
    //           );
    //         },
    //     ),
    //   );
    // }

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
}