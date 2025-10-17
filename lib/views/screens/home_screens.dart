import 'package:flutter/material.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.red
                ),
              ),
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 176, 208, 61)
                ),
              ),
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 83, 222, 92)
                ),
              ),
              Expanded(child: Container(
                width: double.infinity,
                color: Colors.blue,
              ))
            ],
          ),

        )
      ) ,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset("assets/home.png", height: 35, width: 35),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/game.png", height: 35, width: 35),
            label: "Game",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/leader.png", height: 35, width: 35),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/people.png", height: 25, width: 25),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/settings.png", height: 30, width: 30),
            label: "home",
          ),
        ],
      ),
    );
  }
}
