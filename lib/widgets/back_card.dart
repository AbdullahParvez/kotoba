// import 'all_constants.dart';
import 'package:flutter/material.dart';

class BackCard extends StatelessWidget {
  const BackCard(
      {super.key, required this.pronunciation, required this.meaning});
  final String pronunciation;
  final String meaning;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 7,
        shadowColor: Colors.grey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(pronunciation,
                    style: const TextStyle(
                      fontSize: 20,
                      letterSpacing: 1.0,
                    ),
                    textAlign: TextAlign.center),
                const SizedBox(
                  height: 10,
                ),
                Text(meaning,
                    style: const TextStyle(
                      fontSize: 25,
                      letterSpacing: 1.0,
                    ),
                    textAlign: TextAlign.center),
              ],
            )),
        ),
        ),
    );
  }
}
