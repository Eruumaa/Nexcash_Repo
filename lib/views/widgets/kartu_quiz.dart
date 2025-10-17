import 'package:flutter/material.dart';

class KatruQuiz extends StatelessWidget {
  const KatruQuiz({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Text("Test"),
    );
  }
}
