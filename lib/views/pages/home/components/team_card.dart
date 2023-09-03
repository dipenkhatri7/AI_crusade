import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:vac/constants/spaces.dart';

Widget teamCard(String img, String name, Color color) {
  return Container(
    child: Row(
      children: [
        ImageIcon(
          AssetImage("assets/images/logos/" + img),
          size: 38,
          color: color,
        ),
        horizontalSpace(5),
        AutoSizeText(
          name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          textAlign: TextAlign.right,
          maxLines: 2,
        )
      ],
    ),
  );
}
