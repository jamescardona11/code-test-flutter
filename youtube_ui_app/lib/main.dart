import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_ui_app/constants.dart';
import 'package:youtube_ui_app/provider/navigation_provider.dart';
import 'package:youtube_ui_app/views/details_video_view.dart';
import 'package:youtube_ui_app/views/viewpage_parent_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: ChangeNotifierProvider(
        create: (_) => NavigationProvider(),
        child: Scaffold(
          body: DetailVideoView(GeneratorText.getRandomItem(), 1),
        ),
      ),
    );
  }
}
