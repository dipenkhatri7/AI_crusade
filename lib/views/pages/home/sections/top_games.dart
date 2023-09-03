import 'package:flutter/material.dart';
import 'package:vac/constants/consts.dart';
import 'package:vac/constants/spaces.dart';

import '../components/game_card.dart';

class TopGames extends StatelessWidget {
  const TopGames({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blueGrey.shade100,
                    child: Container(
                        padding: EdgeInsets.all(8),
                        child: Image.asset(
                          "assets/images/icons/joyPad.png",
                          color: Colors.blue,
                        )),
                  ),
                  horizontalSpace(10),
                  Text(
                    "Top Games",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              InkWell(onTap: () {}, child: Text("All  "))
            ],
          ),
          verticalSpace(10),
          Container(
            width: GlobalVariable.width - 20,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GameCard(
                    imageURI: "valorant.jpeg",
                    name: "Valorant",
                  ),
                  GameCard(
                    imageURI: "dota2.jpeg",
                    name: "Dota 2",
                  ),
                  GameCard(
                    imageURI: "fortnite.jpeg",
                    name: "Fortntie",
                  ),
                  GameCard(
                    imageURI: "overwatch.jpeg",
                    name: "Overwatch 2",
                  ),
                  GameCard(
                    imageURI: "csgo.jpeg",
                    name: "CS:GO",
                  ),
                  GameCard(
                    imageURI: "pubg.jpeg",
                    name: "PUBG ",
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
