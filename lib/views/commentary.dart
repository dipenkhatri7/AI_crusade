import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Commentary extends StatefulWidget {
  const Commentary({super.key});

  @override
  State<Commentary> createState() => _CommentaryState();
}

class _CommentaryState extends State<Commentary> {
  AudioPlayer player = AudioPlayer();

  bool isPlayed = false;
  Future<void> playLocalAsset() async {
    //At the next line, DO NOT pass the entire reference such as assets/yes.mp3. This will not work.
    //Just pass the file name only.
    // await player.play(AssetSource("output.wav"));
    await player.play(UrlSource("https://e689-35-245-97-88.ngrok.io"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              child: Row(
        children: [
          ElevatedButton(
              onPressed: () async {
                if (isPlayed) {
                  player.resume();
                } else {
                  await playLocalAsset();
                }
              },
              child: Icon(Icons.play_arrow)),
          ElevatedButton(
              onPressed: () async {
                player.pause();
              },
              child: Icon(Icons.pause)),
        ],
      ))),
    );
  }
}
