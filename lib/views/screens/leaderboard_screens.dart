import 'package:flutter/material.dart';
import '../screens/home_screens.dart';
import '../../models/leaderboard_model.dart'; 
import '../widgets/kartu_leaderboard.dart'; 
import 'game_screens.dart'; 

class LeaderboardScreens extends StatefulWidget {
  const LeaderboardScreens({super.key});

  @override
  State<LeaderboardScreens> createState() => _LeaderboardScreens();
}

class _LeaderboardScreens extends State<LeaderboardScreens> {
  final Color primaryTextColor = Color.fromARGB(255, 25, 24, 59);
  

  final List<LeaderboardUser> sortedUsers = List.from(dummyLeaderboardData)
    ..sort((a, b) => b.score.compareTo(a.score));

  void _onItemTapped(int index) {

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const GameScreens()),
      );
    } else if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreens()),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [

                Text(
                  'Leaderboard',
                  style: TextStyle(
                    color: primaryTextColor,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'This week',
                  style: TextStyle(
                    color: primaryTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),


                if (sortedUsers.length >= 3)
                  PodiumWidget(
                    rank2: sortedUsers[1],
                    rank1: sortedUsers[0],
                    rank3: sortedUsers[2],
                  ),
                
                const SizedBox(height: 20),

                if (sortedUsers.length > 3)
                  ...List.generate(sortedUsers.length - 3, (index) {
                    final user = sortedUsers[index + 3];
                   
                    return LeaderboardListItem(
                      rank: index + 4,
                      user: user,
                    );
                  }),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
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
            label: "Leaderboard", 
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/people.png", height: 25, width: 25),
            label: "Profile", 
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/settings.png", height: 30, width: 30),
            label: "Settings", 
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: 2, 
      ),
    );
  }
}