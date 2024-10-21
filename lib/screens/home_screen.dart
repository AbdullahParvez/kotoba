// import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kotoba/data/database_helper.dart';
// import 'package:flutter/services.dart' as root_bundle;
// import 'package:kotoba/data/database_helper.dart';
import 'package:kotoba/screens/unit_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../models/vocab.dart';
import '../widgets/level_display_widget.dart';

// import '../models/vocab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showSpinner = false;

  @override
  initState() {
    super.initState();
    showSpinner = true;
    loadDb();
  }

  loadDb() async {
    bool created = await createDatabase();
    await Future.delayed(const Duration(seconds: 2));
    // List<Kanji> kanji = await fetchAllKanji();
    // print('Got all kanji');
    // for (var k in kanji){
    //   print(k);
    // }
    setState(() {
      showSpinner = false;
    });
    return created;
  }
  //
  Widget getWidget(){
    if (!showSpinner){
      return ListView(
        padding: const EdgeInsets.all(16),
        children: const <Widget>[
          JLPTLevelDisplayWidget(jlptLevel: "N5", level: 5),
          SizedBox(
            height: 4,
          ),
          JLPTLevelDisplayWidget(jlptLevel: "N4", level: 4),
          SizedBox(
            height: 4,
          ),
          JLPTLevelDisplayWidget(jlptLevel: "N3", level: 3),
          SizedBox(
            height: 4,
          ),
          JLPTLevelDisplayWidget(jlptLevel: "N2", level: 2),
          SizedBox(
            height: 4,
          ),
          JLPTLevelDisplayWidget(jlptLevel: "N1", level: 1),
        ],
      );
    }
    return const SpinKitDoubleBounce(
      color: Colors.blueAccent,
      size: 100,
    );
  }

  @override
  Widget build(BuildContext context) {
    // loadVocab();
    return Scaffold(
        appBar: AppBar(
          title: const Text('kotoba'),
        ),
        body:  getWidget(),
        );
  }
}


