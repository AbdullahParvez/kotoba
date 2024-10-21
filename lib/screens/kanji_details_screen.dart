import 'package:flutter/material.dart';

import '../widgets/kanji_grid_widget.dart';

class KanjiDetailsScreen extends StatefulWidget {
  KanjiDetailsScreen({
    super.key,
    required this.kanjiDetails,
  });
  final Map<String, dynamic> kanjiDetails;

  bool showPartsBox = false;
  bool showSimilarOnyomiBox = false;
  bool showUsedAsRadicalBox = false;
  bool showPartsOfOthersBox = false;
  bool showShareSameRadicalBox = false;

  @override
  State<KanjiDetailsScreen> createState() => _KanjiDetailsScreenState();
}

class _KanjiDetailsScreenState extends State<KanjiDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    // print(kanjiDetails);
    String kanji = widget.kanjiDetails['kanji'];
    String onyomi = widget.kanjiDetails['k_onyomi'];
    String kunyomi = widget.kanjiDetails['k_kunyomi'];
    String meaning = widget.kanjiDetails['k_meaning'];
    String jlpt = widget.kanjiDetails['k_jlpt'];
    List<dynamic> kParts = widget.kanjiDetails['k_parts'];
    String radical = widget.kanjiDetails['radical'];
    String radicalMeaning = widget.kanjiDetails['r_meaning'];
    String radicalReadings = widget.kanjiDetails['r_readings'];
    String? radicalAlternative = widget.kanjiDetails['r_alternative'];
    List<dynamic> shareSameRadical = widget.kanjiDetails['share_same_radical'];
    List<dynamic> shareSameOnyomi = widget.kanjiDetails['share_same_onyomi'];
    List<dynamic> hasPart = widget.kanjiDetails['has_part'];
    List<dynamic> usedAsRadical = widget.kanjiDetails['used_as_radical'];
    // List<dynamic> similarSoundedKanji = kanjiDetails['similar_sounded_kanji'];
    // print(similarKanjiList.join(' '));
    // print(kParts);
    // print(shareSameRadical);

    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text(
          widget.kanjiDetails['kanji'],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  width: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        kanji,
                        style: const TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        'Onyomi : $onyomi',
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Kunyomi : $kunyomi',
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Meaning : $meaning',
                        softWrap: true,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Level : $jlpt',
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  width: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Radical : $radical',
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        'Meaning : $radicalMeaning',
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Pronunciation : $radicalReadings',
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      if (radicalAlternative != null)
                        Text(
                          'Alternatives : $radicalAlternative',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      reverse: true,
                      child: Column(
                        children: [
                          if (kParts.isNotEmpty)
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    if (!widget.showPartsBox) {
                                      widget.showPartsBox = true;
                                    } else {
                                      widget.showPartsBox = false;
                                    }
                                  });
                                },
                                child: const Text(
                                  'Parts',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          if (widget.showPartsBox)
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: KanjiGridWidget(
                                kanjiList: kParts,
                                color: Colors.cyan[100],
                              ),
                            ),

                          if (usedAsRadical.isNotEmpty)
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  if (!widget.showUsedAsRadicalBox) {
                                    widget.showUsedAsRadicalBox = true;
                                  } else {
                                    widget.showUsedAsRadicalBox = false;
                                  }
                                });
                              },
                              child: const Text(
                                'Used As Radical',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          if (widget.showUsedAsRadicalBox)
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: KanjiGridWidget(
                              kanjiList: usedAsRadical,
                              color: Colors.purple[200],
                            ),
                          ),
                          if (shareSameOnyomi.isNotEmpty)
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  if (!widget.showSimilarOnyomiBox) {
                                    widget.showSimilarOnyomiBox = true;
                                  } else {
                                    widget.showSimilarOnyomiBox = false;
                                  }
                                });
                              },
                              child: const Text(
                                'Similar Onyomi',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          if (widget.showSimilarOnyomiBox)
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: KanjiGridWidget(
                              kanjiList: shareSameOnyomi,
                              color: Colors.yellow[200],
                            ),
                          ),
                          if (hasPart.isNotEmpty)
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  if (!widget.showPartsOfOthersBox) {
                                    widget.showPartsOfOthersBox = true;
                                  } else {
                                    widget.showPartsOfOthersBox = false;
                                  }
                                });
                              },
                              child: const Text(
                                'Part of Others',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          if (widget.showPartsOfOthersBox)
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: KanjiGridWidget(
                              kanjiList: hasPart,
                              color: Colors.green[200],
                            ),
                          ),
                          if (shareSameRadical.isNotEmpty)
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  if (!widget.showShareSameRadicalBox) {
                                    widget.showShareSameRadicalBox = true;
                                  } else {
                                    widget.showShareSameRadicalBox = false;
                                  }
                                });
                              },
                              child: const Text(
                                'Share Same Radical',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          if (widget.showShareSameRadicalBox)
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: KanjiGridWidget(
                              kanjiList: shareSameRadical,
                              color: Colors.blue[200],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // KanjiGridWidget(
          //   similarSoundedKanji: shareSameRadical,
          // ),
          // KanjiGridWidget(
          //   similarSoundedKanji: hasPart,
          // ),
        ],
      ),
    );
  }
}
