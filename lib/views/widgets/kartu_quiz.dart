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
      child:Row(
        children: [
          Padding(
            padding: EdgeInsets.all(10),child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Part 1"),
                  Text('Dasar Literasi keuangan')
                ],
              )
          )
        ],
      ),
    );
  }
}
