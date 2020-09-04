import 'dart:math';

import 'package:flutter/material.dart';

const kLoadingImage = 'assets/circular_loading.gif';

const kDecorationDetail = BoxDecoration(
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Colors.black,
      spreadRadius: -4,
      blurRadius: 4,
    )
  ],
);

class GeneratorText {
  static InfoVideo getRandomItem() => mapGenerator[Random().nextInt(mapGenerator.length)];

  static final mapGenerator = [
    InfoVideo('Luisito Comunica', 'Así es el castillo de dracula', '1.6M', '1 year ago', '12:05'),
    InfoVideo('MovieClips', 'Man of steel', '7.2M', '6 months ago', '21:15'),
    InfoVideo('Fireship', '7 Database Paradigms', '10K', '5 hours ago', '11:08'),
    InfoVideo('SensaCine', 'Greenland Trailer', '25.1K', '1 week ago', '7:05'),
    InfoVideo('TecnoRR', 'The Best headphone under 300', '250.1K', '3 week ago', '32:05'),
  ];
}

class InfoVideo {
  final String nameUser;
  final String nameVideo;
  final String views;
  final String time;
  final String duration;

  InfoVideo(this.nameUser, this.nameVideo, this.views, this.time, this.duration);

  String get concatValues => '$nameUser · $views · $time';
}
