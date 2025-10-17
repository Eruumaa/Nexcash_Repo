import 'package:flutter/material.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset("assets/home.png", height: 24, width: 24),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/game.png", height: 24, width: 24),
            label: "Game",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/leader.png", height: 24, width: 24),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/people.png", height: 24, width: 24),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/settings.png", height: 24, width: 24),
            label: "home",
          ),
        ],
      ),
    );
  }
}
