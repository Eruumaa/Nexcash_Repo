import 'package:flutter/material.dart';
import '../widgets/button_home.dart';

class KatruQuiz extends StatelessWidget {
  const KatruQuiz({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Part 1",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 25, 24, 59),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Dasar Literasi keuangan',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 25, 24, 59),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Dasar Literasi keuangan"),
                    SizedBox(height: 5),
                    ButtonHome(),
                  ],
                ),
              ),
            ),
            Flexible(child: Image.asset("assets/money.png")),
          ],
        ),
      ),
    );
  }
}
