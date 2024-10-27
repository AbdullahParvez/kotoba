// import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kotoba/data/database_helper.dart';
// import 'package:flutter/services.dart' as root_bundle;
// import 'package:kotoba/data/database_helper.dart';

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
    // await Future.delayed(const Duration(seconds: 2));
    createDatabase();
    // print('database created');
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
          // leading: IconButton(
          //   icon: const Icon(Icons.menu),
          //   tooltip: 'Menu Icon',
          //   onPressed: () {},
          // ),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: (String result) {
                if (result == 'Credit') {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Credit'),
                      content: const Text(
                          'This app utilizes resources from several amazing projects:\n\n'
                              'Vocabulary: JMDict (JMDict Project) provided the foundation for the app\'s extensive vocabulary.\n'
                              'JLPT Levels: Differentiating vocabulary by JLPT level was made possible with the help of the '
                              '"JLPT-N5-N1 Japanese Vocabulary" Ankiweb deck (https://ankiweb.net/shared/info/1550984460).\n'
                              'Radicals: Information on radicals comes from Wikipedia, a valuable source of knowledge.\n'
                              'Kanji Parts: KanjiVG project provided the data for identifying kanji components.\n\n'
                              'Thank you to these incredible projects for contributing to this app!'
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Close'),
                        ),
                      ],
                    ),
                  );
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Credit',
                  child: Text('Credit'),
                ),
              ],
            ),
          ],
        ),
      body: getWidget(),
    );

  }
}


