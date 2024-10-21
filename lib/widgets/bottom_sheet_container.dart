import 'package:flutter/material.dart';

import '../data/database_helper.dart';
import '../models/vocab.dart';

class BottomSheetContainer extends StatefulWidget {
  const BottomSheetContainer({
    super.key,
    required this.kanji,
  });

  final String kanji;

  @override
  State<BottomSheetContainer> createState() => _BottomSheetContainerState();
}

class _BottomSheetContainerState extends State<BottomSheetContainer> {
  Kanji? kanjiDetails;
  @override
  void initState() {
    // TODO: implement initState
    getKanjiDetails();
    super.initState();
  }

  getKanjiDetails() async {
    var kanjiQs = await getKanji(widget.kanji);
    setState(() {
      kanjiDetails = kanjiQs;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (kanjiDetails != null){
      return Container(
        color:const Color(0xff757575),
        height: 400,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color:Colors.purple[50],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              // decoration: const BoxDecoration(
              //   borderRadius: BorderRadius.only(
              //     topLeft: Radius.circular(20),
              //     topRight: Radius.circular(20),
              //   ),
              // ),
              height: 400,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      kanjiDetails!.kanji,
                      style: const TextStyle(
                        fontSize: 50,
                      ),
                    ),
                    if (kanjiDetails!.onyomi !='')
                      Text(
                        'Onyomi : ${kanjiDetails!.onyomi}',
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    Text(
                      'Kunyomi : ${kanjiDetails!.kunyomi}',
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      'Meaning : ${kanjiDetails!.meaning}',
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else{
      return Container(
        color:const Color(0xff757575),
        height: 400,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color:Colors.purple[50],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),

              height: 400,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('No Information available for this kanji.',
                    style: TextStyle(
                      fontSize: 20
                    ),)
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

  }
}