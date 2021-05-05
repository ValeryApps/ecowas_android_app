import 'package:flutter/cupertino.dart';
import "package:http/http.dart" as http;
import "dart:convert" as convert;
import 'package:dartx/dartx.dart';

import 'Story.dart';

class StoryProvider with ChangeNotifier {
  List<Blog> _stories = [];

  List<Blog> get storyItems {
    return [..._stories];
  }

  var pict =
      "https://res.cloudinary.com/valeryguhena/image/upload/v1614007539/xdybyph4fijckdrq5zwu.jpg";
  Future<void> fetchStories() async {
    var url = Uri.parse("http://mobile.ecowas24.com/api/blogs");
    var response = await http.get(url);
    var data = convert.json.decode(response.body) as List<dynamic>;
    List<Blog> stories = [];
    data.forEach((value) {
      var story = Blog(
        title: value["title"],
        imageUrl: value["imageUrl"] ?? pict,
        language: value["language"],
        author: value["author"],
        category: value["category"],
        country: value["country"],
        body: value['body'],
        externUrl: value["externUrl"],
        views: value["views"],
        intro: value['intro'],
        slug: value['slug'],
        id: value['id'],
        datePublished: DateTime.parse(value['datePublished']),
      );
      stories.add(story);
    });
    _stories = stories.sortedByDescending((el) => el.datePublished);
    notifyListeners();
  }

  getStoryBySlug(String slug) {
    var url = Uri.parse("http://mobile.ecowas24.com/api/blogs/slug/$slug");
    http.get(url);
    return _stories.firstWhere((element) => element.slug == slug);
  }

  getStoriesByCountry(String country) {
    return _stories.where((element) => element.country == country).toList();
  }

  getStoriesByCategory(String category) {
    return _stories.where((element) => element.category == category).toList();
  }

  getFavoriteStories() {
    return _stories.where((element) => element.views >= 5).toList();
  }
}
