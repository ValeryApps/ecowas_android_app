

import 'package:ecowas24/models/video.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import "dart:convert" as convert;
import 'package:dartx/dartx.dart';

class VideosProvider with ChangeNotifier{
  List<Video> _videos = [];

  List<Video> get videoItems{
    return [..._videos];
  }
  Future<void> fetchVideos() async{
    var url = Uri.parse("http://mobile.ecowas24.com/api/video");
    var response = await http.get(url);
    var data = convert.json.decode(response.body) as List<dynamic>;
    List<Video> videos = [];
    data.forEach((value) {
      var video = Video(
        id: value['id'],
        title: value["title"],
        intro: value['intro'],
        videoUrl:value['videoUrl'],
        thumbnailUrl: value["thumbnailUrl"] ?? "http://ecowas24.com/assets/video.png",
        language: value["language"],
        author: value["author"],
        category: value["category"],
        country: value["country"],
        views: value["views"],
        slug: value['slug'],
        datePublished: DateTime.parse(value['datePublished']),
      );
      videos.add(video);
    });
    _videos = videos.sortedByDescending((el) => el.datePublished);
    notifyListeners();
  }
}