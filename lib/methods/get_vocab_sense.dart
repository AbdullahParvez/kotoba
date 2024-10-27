import 'package:flutter/material.dart';

import '../widgets/flexible_text_widget.dart';
import '../widgets/styled_text_widget.dart';

List<Widget> getSense(sen) {
  List<Widget> tempList = [];
  if (sen['pos'].length != 0) {
    FlexibleTextWidget posText =
    FlexibleTextWidget(text: sen['pos'].join(", "), fontSize: 15);
    tempList.add(
      Row(
        children: [posText],
      ),
    );
    tempList.add(const SizedBox(
      height: 6,
    ));
  }

  FlexibleTextWidget meaningText =
  FlexibleTextWidget(text: sen['meaning'].join(", "), fontSize: 20);
  tempList.add(
    Row(
      children: [meaningText],
    ),
  );

  if (sen['example'].length > 0) {
    tempList.add(const SizedBox(
      height: 10,
    ));
    // Flexible styledJapaneseSentence = buildStyledText(
    //     sen['example'][0]['ex_sent_jpn'], sen['example'][0]['ex_text']);
    tempList.add(
      Row(
        children: [
          StyledTextWidget(
            mainSentence: sen['example'][0]['ex_sent_jpn'],
            compareText: sen['example'][0]['ex_text'],
          )
        ],
        // children: [styledJapaneseSentence],
      ),
    );

    tempList.add(const SizedBox(
      height: 6,
    ));

    FlexibleTextWidget meaningText = FlexibleTextWidget(
        text: sen['example'][0]['ex_sent_eng'], fontSize: 15);
    tempList.add(
      Row(
        children: [meaningText],
      ),
    );
  }
  return tempList;
}
