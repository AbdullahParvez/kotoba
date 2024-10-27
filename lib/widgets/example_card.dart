import 'package:flutter/material.dart';
import 'package:kotoba/widgets/styled_text_widget.dart';


class ExampleCard extends StatelessWidget {
  final Map<String, dynamic> senseMap;

  const ExampleCard({super.key, required this.senseMap});

  @override
  Widget build(BuildContext context) {
    String partsOfSpeech = senseMap['pos'];
    String meaning = senseMap['meaning'];
    String exText = senseMap['ex_text'];
    String exSentJpn = senseMap['ex_sent_jpn'];
    String exSentEng = senseMap['ex_sent_eng'];
    Map<String, dynamic> tokens = senseMap['tokens'];
    print(tokens);

    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Colors.green[100],
        child: Padding(
          padding: const EdgeInsets.only(left:16.0, right: 16.0, top: 12.0, bottom:12.0,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                meaning,
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4.0),
              if (partsOfSpeech != '') ...[
                Text(
                  partsOfSpeech,
                  style: const TextStyle(fontSize: 12.0),
                ),
                const SizedBox(height: 4.0),
              ],
              if (exSentJpn != '') ...[
                // buildStyledText(exSentJpn, exText),
                StyledTextWidget(
                  mainSentence: exSentJpn,
                  compareText: exText,
                  stokens: tokens,
                ),
                const SizedBox(height: 4.0),
              ],
              if (exSentEng != '') ...[
                Text(
                  exSentEng,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
