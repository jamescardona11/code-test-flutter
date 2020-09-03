import 'dart:async';

import 'package:flutter/material.dart';
import 'package:youtube_ui_app/constants.dart';

const kLoadingImage = 'assets/circular_loading.gif';

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
    final size = MediaQuery.of(context).size;
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
          return _ItemList(GeneratorText.getRandom(), index);
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

class _ItemList extends StatelessWidget {
  final InfoVideo infoVideo;
  final int index;

  _ItemList(this.infoVideo, this.index);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: Container(
              child: FadeInImage(
                placeholder: AssetImage(kLoadingImage),
                image: NetworkImage('https://picsum.photos/500/300?index=${index + 1}'),
              ),
              width: size.width,
            ),
            flex: 3,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  _ImageProfile(),
                  SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        infoVideo.nameVideo,
                        style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        infoVideo.concatValues,
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                  Expanded(child: SizedBox()),
                  Icon(Icons.more_vert)
                ],
              ),
            ),
            flex: 1,
          )
        ],
      ),
    );
  }
}

class _ImageProfile extends StatelessWidget {
  const _ImageProfile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: FadeInImage(
        placeholder: AssetImage(kLoadingImage),
        image: NetworkImage('https://picsum.photos/200/300'),
        width: 55,
        height: 55,
        fit: BoxFit.cover,
      ),
    );
  }
}
