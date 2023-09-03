import 'package:flutter/material.dart';
import 'package:vac/constants/spaces.dart';
import 'package:vac/views/pages/home/components/series_score.dart';
import 'package:vac/views/pages/home/components/team_card.dart';

class ScoreCard extends StatefulWidget {
  const ScoreCard({super.key});

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          teamCard("team1.png", "Faze", Colors.red),
          horizontalSpace(10),
          Text("12",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          SeriesScore(
            score: 1,
            skew: 0.3,
          ),
          horizontalSpace(10),
          Text(":"),
          horizontalSpace(10),
          SeriesScore(
            score: 0,
            skew: -0.3,
          ),
          horizontalSpace(10),
          Text("15",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          teamCard("team2.png", "Sentinels", Colors.blue),
        ],
      ),
    );
  }
}
