import 'package:flutter/material.dart';
import '../../models/leaderboard_model.dart';

// -- WIDGET UNTUK PODIUM TOP 3 --
class PodiumWidget extends StatelessWidget {
  final LeaderboardUser rank1;
  final LeaderboardUser rank2;
  final LeaderboardUser rank3;

  const PodiumWidget({
    super.key,
    required this.rank1,
    required this.rank2,
    required this.rank3,
  });

  @override
  Widget build(BuildContext context) {
    const Color cardColor = Color(0xFFA1C2BD);
    const Color textColor = Color(0xFF19183B);

    return SizedBox(
      height: 250, // Tinggi area podium
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Peringkat 2
          _buildPodiumItem(rank2, 156, cardColor, textColor, '#2'),
          const SizedBox(width: 10),
          // Peringkat 1
          _buildPodiumItem(
            rank1,
            196,
            cardColor,
            textColor,
            '#1',
            isFirstPlace: true,
          ),
          const SizedBox(width: 10),
          // Peringkat 3
          _buildPodiumItem(rank3, 156, cardColor, textColor, '#3'),
        ],
      ),
    );
  }

  Widget _buildPodiumItem(
    LeaderboardUser user,
    double height,
    Color bgColor,
    Color textColor,
    String rank, {
    bool isFirstPlace = false,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          rank,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          width: 90,
          height: height,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isFirstPlace)
                const Icon(Icons.emoji_events, color: Colors.amber, size: 28),
              CircleAvatar(
                radius: 36,
                backgroundColor: Colors.white,
                child: Icon(user.avatarIcon, size: 40, color: textColor),
              ),
              const SizedBox(height: 8),
              Text(
                user.name,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              Text(
                '${user.score} XP',
                style: TextStyle(color: textColor, fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// -- WIDGET UNTUK SETIAP ITEM DI DAFTAR LEADERBOARD (RANK 4 DST) --
class LeaderboardListItem extends StatelessWidget {
  final int rank;
  final LeaderboardUser user;

  const LeaderboardListItem({
    super.key,
    required this.rank,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    const Color cardColor = Color(0xFFA1C2BD);
    const Color textColor = Color(0xFF19183B);

    return Container(
      height: 56,
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(
            '#$rank',
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 15),
          CircleAvatar(
            radius: 19,
            backgroundColor: Colors.white,
            child: Icon(user.avatarIcon, size: 22, color: textColor),
          ),
          const SizedBox(width: 10),
          Text(
            user.name,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          Text(
            '${user.score} XP',
            style: TextStyle(color: textColor, fontSize: 14),
          ),
        ],
      ),
    );
  }
}