import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/vocab.dart';
import '../all_constants.dart';
import 'front_card.dart';
import 'back_card.dart';

class FlashCard extends StatefulWidget {
  const FlashCard({super.key, required this.vocabs});

  final List<Vocab> vocabs;

  @override
  State<FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
  int _currentIndexNumber = 0;
  double _initial = 0.05;

  @override
  Widget build(BuildContext context) {
    // print(_currentIndexNumber);
    int listLength = widget.vocabs.length;
    String value = (_currentIndexNumber + 1).toStringAsFixed(0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flash Card'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Question $value of $listLength Completed",
                style: otherTextStyle),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: LinearProgressIndicator(
                backgroundColor: Colors.white,
                valueColor: const AlwaysStoppedAnimation(Colors.blueAccent),
                minHeight: 5,
                value: _initial,
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: 300,
              height: 300,
              child: FlipCard(
                direction: FlipDirection.VERTICAL,
                front: FrontCard(text: widget.vocabs[_currentIndexNumber].word),
                back: BackCard(
                  pronunciation:
                      widget.vocabs[_currentIndexNumber].pronunciation,
                  meaning: widget.vocabs[_currentIndexNumber].meaning,
                ),
              ),
            ),
            const Text("Tab to see Answer", style: otherTextStyle),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () {
                    showPreviousCard(listLength);
                    updateToPrev();
                  },
                  icon: const Icon(FontAwesomeIcons.handPointLeft, size: 30),
                  label: const Text(""),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.only(
                        right: 20, left: 25, top: 15, bottom: 15),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    showNextCard(listLength);
                    updateToNext();
                  },
                  icon: const Icon(FontAwesomeIcons.handPointRight, size: 30),
                  label: const Text(""),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.only(
                        right: 20, left: 25, top: 15, bottom: 15),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void updateToNext() {
    setState(
      () {
        _initial = _initial + 0.05;
        if (_initial > 1.05) {
          _initial = 0.05;
        }
      },
    );
  }

  void updateToPrev() {
    setState(
      () {
        _initial = _initial - 0.05;
        if (_initial < 0.05) {
          _initial = 1.05;
        }
      },
    );
  }

  void showNextCard(int listLength) {
    setState(
      () {
        _currentIndexNumber = (_currentIndexNumber + 1 < listLength)
            ? _currentIndexNumber + 1
            : 0;
      },
    );
  }

  void showPreviousCard(int listLength) {
    setState(
      () {
        _currentIndexNumber = (_currentIndexNumber - 1 >= 0)
            ? _currentIndexNumber - 1
            : listLength - 1;
      },
    );
  }
}
