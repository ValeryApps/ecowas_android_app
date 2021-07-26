import 'package:flutter/material.dart';

class Video with ChangeNotifier {
  final int id;
  final String title;
  final String category;
  final String intro;
  final String thumbnailUrl;
  final String videoUrl;
  final DateTime datePublished;
  final String author;
  final String country;
  final int views;
  final String language;
  final String slug;

  Video({
    this.id,
    this.title,
    this.category,
    this.intro,
    this.videoUrl,
    this.datePublished,
    this.author,
    this.country,
    this.views,
    this.language,
    this.thumbnailUrl,
    this.slug,
  });
}
