import 'package:flutter/material.dart';
import 'package:vac/constants/spaces.dart';
import 'package:vac/views/pages/home/components/score_card.dart';


class MatchCard extends StatefulWidget {
  MatchCard({super.key, required this.league});
  String league;
  @override
  State<MatchCard> createState() => _MatchCardState();
}

class _MatchCardState extends State<MatchCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.league,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey.shade600),
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blueGrey.shade100,
                    radius: 13,
                    child: Icon(
                      Icons.play_arrow,
                      size: 19,
                      color: Colors.blueAccent.shade400,
                    ),
                  ),
                  horizontalSpace(15),
                  CircleAvatar(
                    backgroundColor: Colors.blueGrey.shade100,
                    radius: 13,
                    child: Icon(
                      Icons.star_border_outlined,
                      size: 19,
                      color: Colors.blueAccent.shade400,
                    ),
                  ),
                ],
              )
            ],
          ),
          verticalSpace(20),
          ScoreCard(),
          verticalSpace(20),
          Text("Best Of 3 Series"),
          verticalSpace(6),
        ],
      ),
    );
  }
}
