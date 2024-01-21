import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeScreen extends StatefulWidget {

  String youtubeUrl;


  YouTubeScreen({Key? key, required this.youtubeUrl}) : super(key: key);

  @override
  _YouTubeScreenState createState() => _YouTubeScreenState();
}

class _YouTubeScreenState extends State<YouTubeScreen> {
  YoutubePlayerController? _controller;
  String? videoId;

  @override
  void initState() {
    super.initState();
    videoId = YoutubePlayer.convertUrlToId(widget.youtubeUrl);
    // _controller = YoutubePlayerController(initialVideoId: videoId!, flags: const YoutubePlayerFlags(autoPlay: true, mute: false));

  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: YoutubePlayerController(initialVideoId: videoId!, flags: const YoutubePlayerFlags(autoPlay: true, mute: false)),
      showVideoProgressIndicator: false, progressIndicatorColor: Colors.green, bottomActions: [CurrentPosition(), ProgressBar(isExpanded: true)],),
      builder: (context, player) {
        return Column(
          children: [
            player
          ],
        );
      },
    );
  }
}
