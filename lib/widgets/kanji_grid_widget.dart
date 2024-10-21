import 'package:flutter/material.dart';

import 'bottom_sheet_container.dart';

class KanjiGridWidget extends StatelessWidget {
  const KanjiGridWidget({
    super.key,
    required this.kanjiList, required this.color,
  });

  final List kanjiList;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6, // Number of columns in the grid
      ),
      itemBuilder: (context, index) {
        return Card(
          color: color,
          margin: const EdgeInsets.all(8.0), // Adjust the margin as needed
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return BottomSheetContainer(
                    kanji: kanjiList[index],
                  );
                },
              );
            },
            child: Center(
              child: Text(
                kanjiList[index],
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      },
      itemCount: kanjiList.length, // Number of grid items
    );
  }
}
