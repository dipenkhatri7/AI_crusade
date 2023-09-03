import 'dart:ui';

import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  GameCard({super.key, required this.imageURI, required this.name});
  String imageURI;
  String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Stack(
        children: [
          Image(
              fit: BoxFit.cover,
              width: 130,
              height: 160,
              image: AssetImage("assets/images/games/" + imageURI)),
          Container(
            color: Colors.black26,
            width: 130,
            height: 160,
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              name,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
