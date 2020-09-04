import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_ui_app/provider/navigation_provider.dart';
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
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset('assets/youtube.png'),
            ),
            title: Text(
              'Youtube',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Image.asset(
                  'assets/imageprofile.jpg',
                  width: 35,
                  height: 35,
                ),
              ),
            ],
          ),
          body: ViewPageParentView(),
        ),
      ),
    );
  }
}
