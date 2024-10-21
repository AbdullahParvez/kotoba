// import 'package:flutter/material.dart';
// import 'package:kotoba/models/vocab.dart';
//
// class VocabListItem extends StatelessWidget {
//   const VocabListItem({super.key, required this.vocab});
//
//   final Vocab vocab;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//           margin: const EdgeInsets.all(3),
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: Colors.grey,
//             ),
//             gradient: LinearGradient(
//               colors: <Color>[
//                 Colors.blue.withOpacity(0.5),
//                 Colors.blue.withOpacity(0.9),
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//             borderRadius: BorderRadius.circular(15),
//           ),
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 Text(
//                   vocab.word,
//                   style: const TextStyle(
//                       fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
//                 ),
//                 Text(
//                   vocab.pronunciation,
//                   style: const TextStyle(
//                       fontSize: 15, color: Colors.white),
//                 ),
//                 Text(
//                   vocab.meaning,
//                   style: const TextStyle(
//                       fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
//                 ),
//               ],
//             ),
//           )
//         ),
//       );
//   }
// }
