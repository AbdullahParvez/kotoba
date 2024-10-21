import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kotoba/data/database_helper.dart';
import 'package:kotoba/widgets/details_card.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../methods/get_meaning_list.dart';
import '../methods/show_alert_dialog.dart';
import '../network/http_controller.dart';
import '../utility.dart';
import '../widgets/hyper_linked_kanji.dart';
import 'kanji_details_screen.dart';

class VocabDetailsScreen extends StatefulWidget {
  const VocabDetailsScreen({
    super.key,
    required this.word,
    // required this.details,
  });
  final String word;
  // final List<dynamic> details;
  @override
  State<VocabDetailsScreen> createState() => _VocabDetailsScreenState();
}

class _VocabDetailsScreenState extends State<VocabDetailsScreen> {
  List<String> kanjiList = [];
  bool showSpinner = false;
  List<dynamic> details = [];
  @override
  void initState() {
    // TODO: implement initState
    getWordDetails(widget.word);
    getAllKanjiFromWord(widget.word);
    super.initState();
  }

  getWordDetails(String word) async {
    try {
      setState(
        () {
          showSpinner = true;
        },
      );

      if (word.contains('/')) {
        word = word.split('/')[0];
      }
      List<dynamic> wordDetails = await getVocabDetails(word);
      setState(
        () {
          details = wordDetails;
          showSpinner = false;
        },
      );
    } on Exception catch (e) {
      setState(() {
        showSpinner = false;
      });
      showAlertDialog(context);
    }
  }

  getAllKanjiFromWord(String word) async {
    List<String> splitWord = word.split('');
    for (var letter in splitWord) {
      var exist = await checkKanji(letter);
      if (exist) {
        setState(() {
          kanjiList.add(letter);
        });
      }
    }
  }

  getDetailsOfKanji(text) async {
    try {
      setState(
        () {
          showSpinner = true;
        },
      );
      var details = await getKanjiDetails(text);
      details = convertSingleQuoteToDoubleQuote(details['details']);
      Map<String, dynamic> kanjiDetails = jsonDecode(details);
      setState(
        () {
          showSpinner = false;
        },
      );
      if (!mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => KanjiDetailsScreen(
            kanjiDetails: kanjiDetails,
          ),
        ),
      );
    } on Exception catch (e) {
      setState(() {
        showSpinner = false;
      });
      showAlertDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var meaning = getMeaningList(details);
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text(
          widget.word,
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: HyperlinkedKanji(
                word: widget.word,
                kanjiList: kanjiList,
                onClick: getDetailsOfKanji,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: meaning.length,
                itemBuilder: (context, index) {
                  return DetailsCard(cardData: meaning[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
