import 'package:flutter/material.dart';


class LeaderboardUser {
  final String name;
  final int score;
  final IconData avatarIcon; 

  const LeaderboardUser({
    required this.name,
    required this.score,
    required this.avatarIcon,
  });
}


const List<LeaderboardUser> dummyLeaderboardData = [
  LeaderboardUser(name: 'Rafid', score: 1444, avatarIcon: Icons.person),
  LeaderboardUser(name: 'Aqil', score: 1420, avatarIcon: Icons.person),
  LeaderboardUser(name: 'Fathir', score: 1400, avatarIcon: Icons.person),
  LeaderboardUser(name: 'Azmi', score: 1350, avatarIcon: Icons.person),
  LeaderboardUser(name: 'Hanif', score: 1320, avatarIcon: Icons.person),
  LeaderboardUser(name: 'Reza', score: 1280, avatarIcon: Icons.person),
  LeaderboardUser(name: 'Raymond', score: 1220, avatarIcon: Icons.person),
  LeaderboardUser(name: 'Nabil', score: 1170, avatarIcon: Icons.person),
  LeaderboardUser(name: 'Dika', score: 1120, avatarIcon: Icons.person),
];