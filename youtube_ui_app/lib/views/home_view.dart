import 'dart:async';

import 'package:flutter/material.dart';
import 'package:youtube_ui_app/constants.dart';
import 'package:youtube_ui_app/widgets/item_list.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<int> _default = [];
  int _lastItem = 0;
  bool _isLoading = false;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _addTenMore();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        //_addTenMore();
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        _createList(),
        _createLoading(),
      ],
    ));
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: _getNewpage,
      child: ListView.builder(
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          return ItemList(GeneratorText.getRandomItem(), index);
        },
        itemCount: _default.length,
      ),
    );
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          ),
          SizedBox(height: 20.0)
        ],
      );
    } else {
      return Container();
    }
  }

  void _addTenMore() {
    for (var i = 1; i < 10; i++) {
      _lastItem++;
      _default.add(_lastItem);
    }

    setState(() {});
  }

  Future<void> _getNewpage() async {
    final duration = Duration(seconds: 2);
    Timer(duration, () {
      _default.clear();
      _lastItem++;
      _addTenMore();
    });

    return Future.delayed(duration);
  }

  Future<void> _fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = Duration(seconds: 2);
    return Timer(duration, () {
      _isLoading = false;

      _scrollController.animateTo(
        _scrollController.position.pixels + 100,
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
      _addTenMore();
    });
  }
}
