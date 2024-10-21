import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screens/unit_screen.dart';

class JLPTLevelDisplayWidget extends ConsumerStatefulWidget {
  const JLPTLevelDisplayWidget(
      {super.key, required this.jlptLevel, required this.level});
  final String jlptLevel;
  final int level;

  @override
  ConsumerState<JLPTLevelDisplayWidget> createState() =>
      _JLPTLevelDisplayWidgetState();
}

class _JLPTLevelDisplayWidgetState
    extends ConsumerState<JLPTLevelDisplayWidget> {
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 80,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
          ),
          gradient: const LinearGradient(
            colors: <Color>[
              Color(0xFF1976D2),
              Color(0xFF42A5F5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () async {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => UnitScreen(level: widget.level),
            ),
          );
        },
        borderRadius: BorderRadius.circular(15),
        child: Center(
          child: Text(
            widget.jlptLevel,
            style: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
