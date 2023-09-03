// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vac/constants/spaces.dart';
import 'package:vac/views/shared/category_list.dart';

class CategoryItem {
  final String name;
  final String icon;
  bool isSelected;

  CategoryItem(
      {required this.name, required this.icon, this.isSelected = false});
}

class Latest extends StatefulWidget {
  const Latest({super.key});

  @override
  State<Latest> createState() => _LatestState();
}

class _LatestState extends State<Latest> {
  int _current = 0;

  List<Color> dotColors = [
    Color.fromRGBO(0, 0, 0, 0.9),
    Color.fromRGBO(0, 0, 0, 0.4),
  ];

  List<CategoryItem> categoryItems = [
    CategoryItem(name: "Counter-Strike", icon: "assets/images/dota.png"),
    CategoryItem(name: "Dota 2", icon: "assets/images/dota.png"),
    CategoryItem(name: "Mobile Legends", icon: "assets/images/dota.png"),
    CategoryItem(name: "VALORANT", icon: "assets/images/dota.png"),
    CategoryItem(name: "PUBG", icon: "assets/images/dota.png"),
    CategoryItem(name: "League of Legends", icon: "assets/images/dota.png"),
  ];
  // offer list

  List gameList = [
    {
      "image": "assets/images/fortnite.jpeg",
      "name": "CSGO",
      "date": "Jan. 19 - Jan. 25",
      "description": "dasgfa",
    },
    {
      "image": "assets/images/dota2.jpeg",
      "name": "CSGO",
      "date": "Jan. 19 - Jan. 25",
      "description": "dasgfa",
    },
    {
      "image": "assets/images/pubg.jpeg",
      "name": "CSGO",
      "date": "Jan. 19 - Jan. 25",
      "description": "dasgfa",
    },
  ];

  void toggleSelected(int index) {
    setState(() {
      for (int i = 0; i < categoryItems.length; i++) {
        categoryItems[i].isSelected = i == index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Discover',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search_outlined,
              size: 28,
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    categoryItems.length,
                    (index) {
                      final category = categoryItems[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: GestureDetector(
                          onTap: () => toggleSelected(index),
                          child: CategoryList(
                            icon: category.icon,
                            name: category.name,
                            isSelected: category.isSelected,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Divider(
                color: Colors.grey[300],
                thickness: 2,
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Featured Games',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double itemWidth = constraints.maxWidth;
                    return CarouselSlider.builder(
                      itemCount: gameList.length,
                      options: CarouselOptions(
                        viewportFraction: itemWidth / constraints.maxWidth,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 5),
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                      itemBuilder: (BuildContext context, int index, _) {
                        return Image(
                            image: AssetImage(gameList[index]["image"]));
                      },
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < gameList.length; i++)
                    Container(
                      width: _current == i ? 10.0 : 8.0,
                      height: _current == i ? 10.0 : 8.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == i ? dotColors[0] : dotColors[1],
                      ),
                    ),
                ],
              ),
              Divider(
                color: Colors.grey[300],
                thickness: 2,
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Latest News',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  NewsCard(
                      title: "TEAM SECRET WINS THE DOTA 2 CHAMPIONSHIP",
                      desc:
                          'DOTA 2 The bloodbath of the qualifiers has reached its end, and the 18 teams that will compete in the ONE Esports Singapore Major have been decided. The Singapore Major will be the first Major of the 2021 DPC season, and the first Major to be held in over a year. The Singapore Major will be held from March 27 to April 4, 2021, and will feature a 500,000 prize pool and 2,700 DPC points.',
                      img: "dota.png"),
                  NewsCard(
                      title: "EG(Easy Gamers) is you new VCT Chamption",
                      desc:
                          "Easy Gamers (EG) emerge as the new champions of the Valorant Champions Tour (VCT)! With their unparalleled skills, teamwork, and unwavering determination, EG has conquered the competitive Valorant scene, cementing their status as the undisputed champions. Their journey to the top was a testament to their dedication and passion for the game, making them a force to be reckoned with. Congratulations to Easy Gamers for their remarkable victory in the VCT, a true testament to their gaming prowess!",
                      img: "news1.jpeg"),
                  NewsCard(
                      title: "Rising Stars Shine in eSports Arena",
                      desc:
                          "In an electrifying turn of events, a group of emerging talents has taken the eSports world by storm. These rising stars, fueled by raw talent and unwavering dedication, have made their mark in various competitive gaming arenas. Their remarkable journey showcases the immense potential within the eSports landscape and serves as an inspiration to aspiring gamers worldwide. Stay tuned for more updates on these remarkable newcomers!",
                      img: "news2.jpeg")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  NewsCard(
      {super.key, required this.title, required this.desc, required this.img});
  String title, desc, img;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: MediaQuery.of(context).size.height / 8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      AutoSizeText(
                        desc,
                        style: TextStyle(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                horizontalSpace(5),
                Image.asset(
                  "assets/images/" + img,
                  width: 100,
                  height: 120,
                  fit: BoxFit.cover,
                )
              ],
            ),
          ),
          verticalSpace(5),
          Row(
            children: [
              Text(
                "6h",
                style: TextStyle(color: Colors.grey),
              ),
              horizontalSpace(4),
              Text("|"),
              horizontalSpace(4),
              Text(
                "esports.com",
                style: TextStyle(color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}
