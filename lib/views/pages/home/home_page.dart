// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vac/constants/consts.dart';
import 'package:vac/constants/spaces.dart';
import 'package:vac/views/pages/home/sections/top_games.dart';
import 'package:vac/views/pages/home/sections/top_live.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [TopGames(), verticalSpace(10), TopLive()],
        ),
      ),
    )));
  }
}
