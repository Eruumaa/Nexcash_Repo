import 'package:flutter/material.dart';

class LeaderboardScreens extends StatelessWidget {
  const LeaderboardScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quix App')),
      body: const Center(
        child: Text(
          'Selamat Datang',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
