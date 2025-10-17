import 'package:flutter/material.dart';

class Progressbar extends StatelessWidget {
  final double progress;
  final double tinggi;
  final Color progressColor;
  final Color remainingColor;

  const Progressbar({
    super.key,
    required this.progress,
    this.tinggi = 10.0,
    this.progressColor = const Color.fromARGB(255, 255, 150, 0),
    this.remainingColor = const Color(0xFFE0E0E0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: tinggi,
      decoration: BoxDecoration(
        color: remainingColor,
        borderRadius: BorderRadius.circular(tinggi / 2),
      ),
      child: Row(
        children: [
         
          Expanded(
            flex: (progress * 100).toInt(),
            child: Container(
              decoration: BoxDecoration(
                color: progressColor,
                borderRadius: BorderRadius.circular(tinggi / 2),
              ),
            ),
          ),
         
          Expanded(
            flex: ((1 - progress) * 100).toInt(),
            child: Container(),
          ),
        ],
      ),
    );
  }
}
