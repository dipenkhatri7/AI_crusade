import 'package:flutter/material.dart';
import 'package:vac/constants/spaces.dart';

class SeriesScore extends StatefulWidget {
  SeriesScore({super.key, required this.score, required this.skew});
  double score;
  double skew;
  @override
  State<SeriesScore> createState() => _SeriesScoreState();
}

class _SeriesScoreState extends State<SeriesScore> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: 10,
            height: 10,
            transform: Matrix4.skewX(widget.skew),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              color: widget.score == 2 || widget.score == 1
                  ? Colors.amber
                  : Colors.white,
            ),
          ),
          verticalSpace(3),
          Container(
            margin: widget.skew > 0
                ? EdgeInsets.only(left: 6)
                : EdgeInsets.only(right: 6),
            width: 10,
            height: 10,
            transform: Matrix4.skewX(widget.skew),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              color: widget.score == 2 ? Colors.amber : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
