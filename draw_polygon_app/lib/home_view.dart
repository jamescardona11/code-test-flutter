import 'package:draw_polygon_app/consts.dart';
import 'package:draw_polygon_app/my_custom_painter.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _PaintArea(),
          SizedBox(height: 10),
          _FloatingActions(),
        ],
      ),
    );
  }
}

class _FloatingActions extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RawMaterialButton(
          onPressed: () {},
          constraints: BoxConstraints(),
          elevation: 2.0,
          fillColor: Colors.white,
          child: Icon(
            Icons.done_all,
            color: Colors.black,
            size: 25.0,
          ),
          padding: EdgeInsets.all(15.0),
          shape: CircleBorder(),
        ),
        SizedBox(width: 20),
        RawMaterialButton(
          onPressed: () {},
          constraints: BoxConstraints(),
          elevation: 2.0,
          fillColor: Colors.white,
          child: Icon(
            Icons.layers_clear,
            color: Colors.black,
            size: 25.0,
          ),
          padding: EdgeInsets.all(15.0),
          shape: CircleBorder(),
        ),
      ],
    );
  }
}

class _PaintArea extends StatefulWidget {
  @override
  _PaintAreaState createState() => _PaintAreaState();
}

class _PaintAreaState extends State<_PaintArea> {
  final points = ValueNotifier<List<Offset>>([]);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /*if (widget.clearArea) {
      points.value = [];
    }*/
    return Center(
      child: Container(
        width: size.width * 0.8,
        height: size.height * 0.8,
        decoration: kDecoration,
        child: GestureDetector(
          onPanDown: (details) {
            addPoint(details.localPosition);
          },
          child: ValueListenableBuilder(
            valueListenable: points,
            builder: (context, value, child) => CustomPaint(
              painter: MyCustomPainter(value),
            ),
          ),
        ),
      ),
    );
  }

  void addPoint(Offset point) {
    points.value = List<Offset>.from(points.value)..add(point);
  }
}
