import 'package:draw_polygon_app/consts.dart';
import 'package:draw_polygon_app/my_custom_painter.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool clearArea = false;
  bool complete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _PaintArea(
            clearArea: clearArea,
            completePolygon: complete,
          ),
          SizedBox(height: 10),
          _FloatingActions(
            clearCanvas: clearCanvas,
            completePolygon: completePolygon,
          ),
        ],
      ),
    );
  }

  void clearCanvas() {
    setState(() {
      clearArea = true;
      complete = false;
    });
  }

  void completePolygon() {
    setState(() {
      complete = true;
      clearArea = false;
    });
  }
}

class _FloatingActions extends StatelessWidget {
  final VoidCallback clearCanvas;
  final VoidCallback completePolygon;

  const _FloatingActions({
    this.clearCanvas,
    this.completePolygon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RawMaterialButton(
          onPressed: completePolygon,
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
          onPressed: clearCanvas,
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
  final bool clearArea;
  final bool completePolygon;

  _PaintArea({
    this.clearArea = false,
    this.completePolygon = false,
  });

  @override
  _PaintAreaState createState() => _PaintAreaState();
}

class _PaintAreaState extends State<_PaintArea> {
  final points = ValueNotifier<List<Offset>>([]);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (widget.clearArea) {
      points.value = [];
    }
    return Center(
      child: Container(
        width: size.width * 0.8,
        height: size.height * 0.8,
        decoration: kDecoration,
        child: Stack(
          fit: StackFit.expand,
          children: [
            GestureDetector(
              onPanDown: (details) {
                if (!widget.completePolygon) {
                  addPoint(details.localPosition);
                }
              },
              child: ValueListenableBuilder(
                valueListenable: points,
                builder: (context, value, child) => CustomPaint(
                  painter: MyCustomPainter(value, widget.completePolygon),
                ),
              ),
            ),
            if (widget.completePolygon)
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'CLEAR AREA',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void addPoint(Offset point) {
    points.value = List<Offset>.from(points.value)..add(point);
  }
}
