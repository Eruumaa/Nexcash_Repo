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
            icon: ImageIcon(AssetImage("Nexcash_Repo/lib/views/assets/home.png")),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home"
          ), 
          
        ]
      ),
    );
  }
}
