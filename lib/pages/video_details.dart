import 'package:ecowas24/models/video.dart';
import 'package:ecowas24/models/videos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// ignore: must_be_immutable
class VideoDetails extends StatelessWidget {
  static const routeName = "video-details";
  YoutubePlayerController _controller;
  @override
  Widget build(BuildContext context) {
    final int id = ModalRoute.of(context).settings.arguments as int;
    final videos = Provider.of<VideosProvider>(context).videoItems;
    Video video = videos.firstWhere((element) => element.id == id);
    var urlId = video.videoUrl.substring(video.videoUrl.lastIndexOf('/') + 1);
    print(urlId);
    _controller = YoutubePlayerController(
      initialVideoId: urlId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.amber,
    );
  }
}
