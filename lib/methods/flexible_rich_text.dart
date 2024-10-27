// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:kotoba/models/vocab.dart';
// import 'package:path/path.dart';
// import 'package:japanese_word_tokenizer/japanese_word_tokenizer.dart';
// import 'package:kotoba/data/database_helper.dart';
//
// Flexible buildStyledText(String mainSentence, String compareText) {
//   List<InlineSpan> textSpans = [];
//
//   List<String> words = mainSentence.split(compareText);
//
//   // for  (final word in words){
//   //   // tokenize(word);
//   //   if (word.isNotEmpty){
//   //     List<dynamic> tokens = tokenize(word);
//   //     print(tokens);
//   //   }
//   // }
//   List<dynamic> tokens = tokenize(mainSentence);
//   print(tokens);
//
//
//   for (var token in tokens) {
//     final isMatch = token == compareText;
//
//     textSpans.add(
//       TextSpan(
//         text: token.toString(), // Ensure `token` is converted to string here
//         style: TextStyle(
//           fontSize: 16,
//           color: isMatch ? Colors.purple : Colors.black,
//           fontWeight: isMatch ? FontWeight.bold : FontWeight.normal,
//         ),
//         recognizer: TapGestureRecognizer()
//           ..onTap = () async {
//             print('Tapped on $token');
//             Vocab? vocabDetails = await getVocab(token);
//             showDialog(context: context, builder: builder)
//             print(vocabDetails?.word);
//           },
//       ),
//     );
//   }
//
//   // // print(words);
//   // textSpans.add(
//   //   WidgetSpan(
//   //     child: SelectableText(
//   //       words[0],
//   //       style: const TextStyle(
//   //         fontSize: 16,
//   //         color: Colors.black,
//   //       ),
//   //
//   //       contextMenuBuilder: (BuildContext context, EditableTextState editableTextState) {
//   //         return AdaptiveTextSelectionToolbar(
//   //           anchors: editableTextState.contextMenuAnchors,
//   //           children: [
//   //             TextButton(
//   //               onPressed: () {
//   //                 // Custom action for "Custom Option 1"
//   //
//   //                 print('Get Meaning');
//   //                 // Navigator.pop(context);
//   //               },
//   //               child: const Text('Custom Option 1'),
//   //             ),
//   //             TextButton(
//   //               onPressed: () {
//   //                 // Custom action for "Custom Option 2"
//   //                 print('Custom Option 2 selected');
//   //                 Navigator.pop(context);
//   //               },
//   //               child: const Text('Custom Option 2'),
//   //             ),
//   //             TextButton(
//   //               onPressed: () {
//   //                 // Default copy action
//   //                 editableTextState.copySelection(SelectionChangedCause.toolbar);
//   //                 Navigator.pop(context);
//   //               },
//   //               child: const Text('Copy'),
//   //             ),
//   //           ],
//   //         );
//   //       },
//   //     ),
//   //   ),
//   //   // TextSpan(
//   //   //   text: words[0],
//   //   //   style: const TextStyle(
//   //   //     fontSize: 16,
//   //   //     color: Colors.black,
//   //   //   ),
//   //   // ),
//   // );
//   // textSpans.add(
//   //   TextSpan(
//   //     text: compareText,
//   //     style: const TextStyle(
//   //       fontSize: 16,
//   //       color: Colors.purple, // Set your desired color here
//   //       fontWeight: FontWeight.bold,
//   //       // You can apply other styles as needed
//   //     ),
//   //   ),
//   // );
//   // textSpans.add(
//   //   WidgetSpan(
//   //     child: SelectableText(
//   //       words[1],
//   //       style: const TextStyle(
//   //         fontSize: 16,
//   //         color: Colors.black,
//   //       ),
//   //
//   //     ),
//   //   ),
//   //   // TextSpan(
//   //   //   text: words[1],
//   //   //   style: const TextStyle(
//   //   //     fontSize: 16,
//   //   //     color: Colors.black,
//   //   //   ),
//   //   // ),
//   // );
//
//   return Flexible(
//     fit: FlexFit.loose,
//     child: RichText(
//       softWrap: true,
//       text: TextSpan(
//         children: textSpans,
//       ),
//     ),
//   );
// }
