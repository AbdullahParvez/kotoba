import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    super.key,
    required Size screen,
    required this.option,
    required this.borderColor,
    required this.onSelectCard,
    required this.optionNo,
  }) : _screen = screen;

  final Size _screen;
  final int optionNo;
  final String option;
  final Color borderColor;
  final void Function(int cardNo, String text) onSelectCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // gradient: LinearGradient(
        //   colors: <Color>[
        //     Colors.white70.withOpacity(.5),
        //     Colors.white.withOpacity(.9),
        //   ],
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        // ),
        border: Border.all(
          color: borderColor,
          width: 2.0,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.orangeAccent.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      width: _screen.width * 0.45,
      height: _screen.height * 0.16,
      child: InkWell(
        onTap: () {
          onSelectCard(optionNo, option);
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: Center(
                  child: Text(
                    option,
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
