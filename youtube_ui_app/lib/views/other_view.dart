import 'package:flutter/material.dart';

class OtherView extends StatelessWidget {
  final String title;

  OtherView(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(title),
      ),
    );
  }
}
