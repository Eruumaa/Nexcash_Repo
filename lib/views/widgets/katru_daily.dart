import 'package:flutter/material.dart';

class KatruDaily extends StatelessWidget {
  const KatruDaily({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
  crossAxisAlignment: CrossAxisAlignment.start, 
  children: [
    Image.asset("assets/fire.png"),
    SizedBox(width: 10),
    Text(
      "12",
      style: TextStyle(
        color: Color.fromARGB(255,255, 150, 0),
        fontSize: 40,
        fontWeight: FontWeight.bold
      ),
    ),
    SizedBox(width: 10),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          Text(
            "Day Streak",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            "Stay consistent",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    ),
  ],
);

  }
}
