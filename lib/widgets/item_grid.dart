import 'package:flutter/material.dart';
import 'package:kotoba/screens/set_screen.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class GridItem extends StatelessWidget {
  const GridItem(
      {super.key, required this.level, required this.id, required this.color, required this.onSelectCard});

  final String level;
  final int id;
  final Color color;
  final void Function(int id) onSelectCard;

  @override
  Widget build(BuildContext context) {
    // return Card(
    //   // Customize your card as needed
    //   child: Column(
    //     children: [
    //       // Other card content
    //       SizedBox(
    //         height: 100, // Adjust height as needed
    //         child: WaveWidget(
    //           config: CustomConfig(
    //             gradients: [
    //               [Colors.blue, Colors.blueAccent],
    //             ],
    //             durations: [5000],
    //             heightPercentages: [50], // Set the progress level
    //             blur: const MaskFilter.blur(BlurStyle.solid, 10),
    //           ),
    //           waveAmplitude: 20.0,
    //           size: const Size(double.infinity, 50.0), // Adjust size as needed
    //         ),
    //       ),
    //     ],
    //   ),
    // );
    return InkWell(
      onTap: () {
        onSelectCard(id);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
        // child:Card(
        //   // Customize your card as needed
        //   child: Column(
        //     children: [
        //       // Other card content
        //       SizedBox(
        //         height: 100, // Adjust height as needed
        //         child: WaveWidget(
        //           config: CustomConfig(
        //             gradients: [
        //               [Colors.blue, Colors.blueAccent],
        //             ],
        //             durations: [5000],
        //             heightPercentages: [.1], // Set the progress level
        //             blur: const MaskFilter.blur(BlurStyle.solid, 5),
        //           ),
        //           waveAmplitude: .5,
        //           size: const Size(double.infinity, .5), // Adjust size as needed
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.55),
              color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Text(
            level,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 40,
                ),
          ),
        ),
      ),
    );
  }
}


Widget buildProgressCard(double progress) {
  return Card(
    // Customize your card as needed
    child: Column(
      children: [
        // Other card content
        SizedBox(
          height: 100, // Adjust height as needed
          child: WaveWidget(
            config: CustomConfig(
              gradients: [
                [Colors.blue, Colors.blueAccent],
              ],
              durations: [5000],
              heightPercentages: [5], // Set the progress level
              blur: const MaskFilter.blur(BlurStyle.solid, 10),
            ),
            waveAmplitude: 20.0,
            size: const Size(double.infinity, 50.0), // Adjust size as needed
          ),
        ),
      ],
    ),
  );
}
