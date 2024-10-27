import 'package:flutter/material.dart';

import '../data/database_helper.dart';
import '../models/vocab.dart';

class WordDetails extends StatefulWidget {
  const WordDetails({super.key, required this.vocab});

  final String vocab;

  @override
  State<WordDetails> createState() => _WordDetailsState();
}

class _WordDetailsState extends State<WordDetails> {
  Vocab? vocabDetails;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getVocabDetails();
  }

  getVocabDetails() async {
    Vocab? vocab = await getVocab(widget.vocab);
    if (vocab != null) {
      setState(() {
        vocabDetails = vocab;
      });
    }
  }

  List<Widget> getDetails(Vocab? vocab){
    if (vocab != null){
      return [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Text(
            vocabDetails?.word ?? 'No word found',
            style: const TextStyle(
              fontSize: 40.0,
              color: Colors.black87,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Text(
            vocabDetails?.pronunciation ?? 'No pronunciation found',
            style: const TextStyle(
              fontSize: 24.0,
              color: Colors.black87,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Text(
            vocabDetails?.meaning ?? 'No meaning found',
            style: const TextStyle(
              fontSize: 26.0,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 15),
        TextButton(
          style: ButtonStyle(
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              )),
          child: const Text(
            'Close',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ];
    }
    return [
      const Text('No word found'),
      const SizedBox(height: 15),
      TextButton(
        style: ButtonStyle(
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            )),
        child: const Text(
          'Close',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ];

  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      backgroundColor: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: getDetails(vocabDetails),
        ),
      ),
    );
  }
}
