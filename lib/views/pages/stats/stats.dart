import 'package:flutter/material.dart';
import 'package:vac/views/shared/list_tiles.dart';
import 'package:vac/views/shared/stats_box.dart';

class Stats extends StatefulWidget {
  const Stats({super.key});

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  String getDate() {
    DateTime now = DateTime.now();
    String formattedDate = "${now.year}";
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 50, bottom: 20),
              color: Theme.of(context).primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Statistics',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${getDate()} Top Stats',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Divider(
                    color: Colors.grey[100],
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StatsBox(
                        title: 'Kills',
                        value: '3',
                        image: 'assets/images/p210156.png',
                      ),
                      StatsBox(
                        title: 'Most Assists',
                        value: '5',
                        image: 'assets/images/p210156.png',
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.transparent,
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StatsBox(
                        title: 'Attack Damage',
                        value: '20',
                        image: 'assets/images/p210156.png',
                      ),
                      StatsBox(
                        title: 'Most Takedowns',
                        value: '14',
                        image: 'assets/images/p210156.png',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: Text(
                      'Top Champions',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTiles(
                    title: 'All-Time Stats',
                    icon: Icons.arrow_forward,
                  ),
                  ListTiles(
                    title: 'Records',
                    icon: Icons.arrow_forward,
                  ),
                  ListTiles(
                    title: 'Player Comparison',
                    icon: Icons.arrow_forward,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
