import 'package:flutter/material.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items:  const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/home.png")),
            label: "home"
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/game.png")),
            label: "home"
          ), 
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home"
          ), 
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home"
          ), 
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home"
          ), 
          
        ]
      ),
    );
  }
}
