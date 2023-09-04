// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:vac/constants/spaces.dart';
import 'package:vac/views/commentary.dart';
import 'package:vac/views/pages/home/components/score_card.dart';
import 'package:video_player/video_player.dart';

class MatchCard extends StatefulWidget {
  MatchCard({super.key, required this.league});
  String league;
  @override
  State<MatchCard> createState() => _MatchCardState();
}

class _MatchCardState extends State<MatchCard> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://drive.google.com/file/d/1II05rVahfG1lLaXLvd51xR77bzJgUK-g/view?usp=sharing',
      ),
    );

    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  AudioPlayer player = AudioPlayer();

  bool isPlayed = false;
  Future<void> playLocalAsset() async {
    //At the next line, DO NOT pass the entire reference such as assets/yes.mp3. This will not work.
    //Just pass the file name only.
    await player.play(AssetSource("output.wav"));
    // await player.play(UrlSource("https://e689-35-245-97-88.ngrok.io"));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            constraints: BoxConstraints(maxHeight: 500),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            context: context,
            builder: (context) {
              return DraggableScrollableSheet(
                  initialChildSize: 1,
                  builder: (_, scrollController) {
                    return Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          verticalSpace(15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  "LIVE",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.red),
                                ),
                              ),
                              horizontalSpace(10),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.red,
                              )
                            ],
                          ),
                          verticalSpace(20),
                          ScoreCard(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: [
                                    Text("EN"),
                                    horizontalSpace(5),
                                    Image.asset("assets/images/usa.webp",
                                        width: 20),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          FutureBuilder(
                            future: _initializeVideoPlayerFuture,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                // If the VideoPlayerController has finished initialization, use
                                // the data it provides to limit the aspect ratio of the video.
                                return Container(
                                    width: 300,
                                    height: 150,
                                    child: VideoPlayer(_controller));
                              } else {
                                // If the VideoPlayerController is still initializing, show a
                                // loading spinner.
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                          IconButton(
                            onPressed: () async {
                              // Wrap the play or pause in a call to `setState`. This ensures the
                              // correct icon is shown.
                              setState(() async {
                                // If the video is playing, pause it.
                                if (_controller.value.isPlaying) {
                                  _controller.pause();
                                } else {
                                  // If the video is paused, play it.
                                  _controller.play();
                                }
                                if (isPlayed) {
                                  player.resume();
                                } else {
                                  await playLocalAsset();
                                }
                              });
                            },
                            // Display the correct icon depending on the state of the player.
                            icon: Icon(
                              _controller.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                            ),
                          ),
                          verticalSpace(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () async {
                                    player.seek(Duration(seconds: -10));
                                  },
                                  icon: Icon(Icons.skip_previous_rounded)),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.black,
                                child: IconButton(
                                    onPressed: () async {
                                      player.pause();
                                      _controller.pause();
                                    },
                                    icon: Icon(
                                      Icons.pause,
                                      color: Colors.white,
                                    )),
                              ),
                              IconButton(
                                  onPressed: () async {
                                    player.seek(Duration(seconds: 10));
                                  },
                                  icon: Icon(Icons.skip_next))
                            ],
                          )
                        ],
                      ),
                    );
                  });
            });
      },
      child: Container(
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
      ),
    );
  }
}
