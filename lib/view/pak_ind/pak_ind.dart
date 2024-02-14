import 'package:flutter/material.dart';
import 'package:news_app_project_1/view/dashboard/dashboard.dart';
import 'package:news_app_project_1/view/matchesList/matchesList.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PakInd extends StatefulWidget {
  const PakInd({super.key});

  @override
  State<PakInd> createState() => _PakIndState();
}

class _PakIndState extends State<PakInd> {
  @override
  void initState() {
    super.initState();
    youtubePlayerController = YoutubePlayerController(
        initialVideoId: "WQdqgrWvy6g",
        flags: const YoutubePlayerFlags(
            autoPlay: false, mute: true, isLive: false));
  }

  YoutubePlayerController? youtubePlayerController;
  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: youtubePlayerController!,
          progressColors: const ProgressBarColors(
              playedColor: Colors.red, handleColor: Colors.redAccent),
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
        ),
        builder: (context, player) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Videos",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MatchesList()));
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
              backgroundColor: Colors.blue,
            ),
            body: player,
          );
        });
  }
}
