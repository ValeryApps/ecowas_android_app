import 'package:flutter/cupertino.dart';

class Blog with ChangeNotifier {
  final int id;
  final String title;
  final String category;
  final String intro;
  final String body;
  final String imageUrl;
  final DateTime datePublished;
  final String author;
  final String country;
  final int views;
  final String language;
  final String externUrl;
  final String slug;

  Blog({
    this.id,
    this.title,
    this.category,
    this.intro,
    this.body,
    this.imageUrl,
    this.datePublished,
    this.author,
    this.country,
    this.externUrl,
    this.language,
    this.views,
    this.slug,
  });
}
