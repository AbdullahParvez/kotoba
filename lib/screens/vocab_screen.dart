import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoba/models/vocab.dart';
import 'package:kotoba/screens/question_screen.dart';
import 'package:kotoba/screens/vocab_details_screen.dart';
import 'package:kotoba/widgets/flash_card.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../data/database_helper.dart';
import '../providers/provider.dart';

class VocabScreen extends ConsumerStatefulWidget {
  const VocabScreen({super.key, required this.set});
  final int set;
  // final void Function() refreshPreviousPage;

  @override
  ConsumerState<VocabScreen> createState() => _VocabScreenState();
}

class _VocabScreenState extends ConsumerState<VocabScreen>
    with AutomaticKeepAliveClientMixin {
  final ScrollController _scrollController = ScrollController();
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  List<Vocab> _vocabs = [];
  QuestionSet? questionSet;
  int isCompleted = 0;
  bool showSpinner = false;
  var appBarHeight = AppBar().preferredSize.height;
  loadSet() async {
    List<Vocab> vocabs = await fetchAllVocabBySet(widget.set);
    setState(() {
      _vocabs = vocabs;
    });
  }

  getSet() async {
    QuestionSet quesSet = await getQuesSet(widget.set);
    // print(quesSet.id);
    setState(() {
      questionSet = quesSet;
      isCompleted = quesSet.isCompleted;
    });
    // print(quesSet.isCompleted);-
  }

  @override
  initState() {
    loadSet();
    getSet();
    super.initState();
  }

  Color getIconColor() {
    if (isCompleted == 0) {
      return Colors.grey;
    } else {
      return Colors.orangeAccent;
    }
  }

  PopupMenuItem _buildPopupMenuItem(
      String title, IconData iconData, int value) {
    return PopupMenuItem(
      value: value,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            iconData,
            color: Colors.blueAccent[200],
          ),
          Text(title),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vocabulary'),
        actions: [
          IconButton(
            onPressed: () async {
              setState(() {
                if (isCompleted == 0) {
                  isCompleted = 1;
                } else {
                  isCompleted = 0;
                }
              });
              // print(questionSet!.id);
              QuestionSet updatedSet = QuestionSet(
                  id: questionSet!.id,
                  no: questionSet!.no,
                  isCompleted: isCompleted,
                  unit: questionSet!.unit);
              // print(updatedSet);
              updateSetCheckCompleted(questionSet!.id, updatedSet);
              ref.read(setProvider.notifier).loadSet(questionSet!.unit);
              // widget.refreshPreviousPage();
            },
            icon: Icon(
              Icons.done_all,
              size: 40,
              color: getIconColor(),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => FlashCard(
                    vocabs: _vocabs,
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.bolt,
              size: 40,
              color: Colors.limeAccent,
            ),
          ),
          PopupMenuButton(
            onSelected: (value) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) =>
                      QuestionScreen(vocabs: _vocabs, testNo: value),
                ),
              );
            },
            offset: Offset(0.0, appBarHeight),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
            ),
            itemBuilder: (BuildContext context) => [
              _buildPopupMenuItem('Kanji Test 1', Icons.book_rounded, 1),
              _buildPopupMenuItem('Kanji Test 2', Icons.book_rounded, 2),
              _buildPopupMenuItem('Kanji Test 3', Icons.book_rounded, 3),
              _buildPopupMenuItem('Kanji Test 4', Icons.book_rounded, 4),
              _buildPopupMenuItem('Meaning Test 1', Icons.book_rounded, 5),
              _buildPopupMenuItem('Meaning Test 2', Icons.book_rounded, 6),
              _buildPopupMenuItem('Meaning Test 3', Icons.book_rounded, 7),
              _buildPopupMenuItem('Meaning Test 4', Icons.book_rounded, 8),
            ],
          ),
        ],
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _vocabs.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListTile(
                tileColor: Colors.blue[200],
                title: Text(
                  _vocabs[index].word,
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                subtitle: Text(
                  "${_vocabs[index].pronunciation}\n${_vocabs[index].meaning}",
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                isThreeLine: true,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) =>
                          VocabDetailsScreen(word: _vocabs[index].word),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
