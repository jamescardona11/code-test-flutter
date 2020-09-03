import 'package:draw_polygon_app/consts.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _PaintArea(),
      ],
    );
  }
}

class _PaintArea extends StatefulWidget {
  @override
  __PaintAreaState createState() => __PaintAreaState();
}

class __PaintAreaState extends State<_PaintArea> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.width * 0.8,
        height: size.height * 0.8,
        decoration: kDecoration,
      ),
    );
  }
}
