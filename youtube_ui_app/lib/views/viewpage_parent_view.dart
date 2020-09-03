import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_ui_app/provider/navigation_provider.dart';

import 'home_view.dart';
import 'other_view.dart';

class ViewPageParentView extends StatefulWidget {
  @override
  _ViewPageParentViewState createState() => _ViewPageParentViewState();
}

class _ViewPageParentViewState extends State<ViewPageParentView> {
  @override
  void initState() {
    super.initState();
    //controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) => Provider.of<NavigationProvider>(context, listen: false).onChangeIndex(index),
        children: [
          HomeView(),
          OtherView('Explore'),
          OtherView('Subscription'),
          OtherView('Notifications'),
          OtherView('Library'),
        ],
        controller: Provider.of<NavigationProvider>(context, listen: false).controller,
      ),
    );
  }
}
