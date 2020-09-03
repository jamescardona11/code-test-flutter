import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_ui_app/provider/navigation_provider.dart';
import 'package:youtube_ui_app/views/viewpage_parent_view.dart';
import 'package:youtube_ui_app/widgets/bottom_navigation_widget.dart';
import 'package:youtube_ui_app/views/home_view.dart';
import 'package:youtube_ui_app/views/other_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ChangeNotifierProvider(
        create: (_) => NavigationProvider(),
        child: Scaffold(
          body: ViewPageParentView(),
          bottomNavigationBar: MyBottomNavigationBar(),
        ),
      ),
    );
  }
}
