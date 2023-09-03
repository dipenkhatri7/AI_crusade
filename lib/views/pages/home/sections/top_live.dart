import 'package:flutter/material.dart';
import 'package:vac/constants/consts.dart';
import 'package:vac/constants/spaces.dart';
import 'package:vac/views/pages/home/components/live_card.dart';


import '../components/game_card.dart';

class TopLive extends StatelessWidget {
  const TopLive({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blueGrey.shade100,
                  child: Icon(
                    Icons.trending_up,
                    color: Colors.blueAccent,
                  )),
              horizontalSpace(10),
              const Text(
                "Top Live",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              horizontalSpace(5),
              const CircleAvatar(
                radius: 6,
                backgroundColor: Colors.red,
              )
            ],
          ),
          verticalSpace(10),
          LiveCard(
            img: "dota2.png",
            name: "Dota 2",
          ),
          verticalSpace(10),
          LiveCard(
            img: "valorant.webp",
            name: "Valorant",
          ),
          verticalSpace(10),
          LiveCard(
            img: "csgo.webp",
            name: "CS:GO ",
          )
        ],
      ),
    );
  }
}
