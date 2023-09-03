// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vac/constants/spaces.dart';
import 'package:vac/views/pages/home/components/match_card.dart';

class LiveCard extends StatefulWidget {
  LiveCard({super.key, required this.img, required this.name});
  String img, name;

  @override
  State<LiveCard> createState() => _LiveCardState();
}

class _LiveCardState extends State<LiveCard> {
  double angle = 0;
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            splashFactory: NoSplash.splashFactory,
            onTap: () {
              setState(() {
                print(angle);
                if (angle == 360) {
                  angle = 0;
                } else {
                  angle = 360;
                }
                visible = !visible;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/logos/' + widget.img,
                      ),
                      height: 37,
                      width: 37,
                    ),
                    horizontalSpace(5),
                    Text(widget.name),
                  ],
                ),
                Transform.rotate(
                  angle: pi / 360 * angle,
                  child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.blueGrey.shade100,
                      child: Icon(
                        Icons.arrow_drop_down_sharp,
                        color: Colors.black,
                      )),
                )
              ],
            ),
          ),
          verticalSpace(10),
          Visibility(
            visible: visible,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MatchCard(league: "CS:GO ESL league 2023"),
                verticalSpace(5),
                MatchCard(league: "CS:GO Reginals")
              ],
            ),
          )
        ],
      ),
    );
  }
}
