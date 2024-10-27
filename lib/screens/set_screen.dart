import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoba/providers/provider.dart';
import 'package:kotoba/screens/vocab_screen.dart';
import 'package:kotoba/widgets/item_grid.dart';

import '../models/vocab.dart';

class SetScreen extends ConsumerStatefulWidget {
  const SetScreen({super.key, required this.unit});
  final int unit;

  @override
  ConsumerState<SetScreen> createState() => _SetScreenState();
}

class _SetScreenState extends ConsumerState<SetScreen> {

  // bool _needsRefresh = false;

  // loadSet() async {
  //   List<QuestionSet> sets = await fetchAllSetByUnit(widget.unit);
  //   setState(() {
  //     _questionSets = sets;
  //   });
  // }

  @override
  initState() {
    // loadSet();
    ref.read(setProvider.notifier).loadSet(widget.unit);
    super.initState();
  }

  void onSelectCard(int id){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => VocabScreen(set: id),
      ),
    );
  }

  Color getColor(int isCompleted){
    if(isCompleted==0){
      return Colors.purpleAccent;
    }else{
      return Colors.greenAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    // for (var s in _sets){
    //   print(s.no.toString());
    // }
    // if (_needsRefresh) {
    //   // Refresh the data for the page.
    //   initState();
    //   _needsRefresh = false;
    // }
      List<QuestionSet> questionSets = ref.watch(setProvider);
      return Scaffold(
      appBar: AppBar(
        title: const Text("Set"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: [
          for (var s in questionSets)
            GridItem(
              level: s.no.toString(),
              id: s.id,
              color: getColor(s.isCompleted),
              onSelectCard: onSelectCard,
            ),
        ],
      ),
    );
  }
}
