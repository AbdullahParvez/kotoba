import 'package:flutter/material.dart';
import 'package:kotoba/widgets/example_card.dart';

import '../models/details_card_item.dart';

class DetailsCard extends StatelessWidget {
  final CardItem cardData;

  const DetailsCard({super.key, required this.cardData});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[100],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              cardData.word,
              style: const TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              cardData.reading,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8.0),
            for (var sense in cardData.sense) ExampleCard(senseMap: sense)
          ],
        ),
      ),
    );
  }
}
