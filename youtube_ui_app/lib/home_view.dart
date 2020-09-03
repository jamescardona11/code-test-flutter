import 'package:flutter/material.dart';
import 'package:youtube_ui_app/constants.dart';

const kLoadingImage = 'assets/circular_loading.gif';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: _ItemList(GeneratorText.getRandom()),
      ),
      bottomNavigationBar: _MyBottomNavigationBar(),
    );
  }
}

class _MyBottomNavigationBar extends StatefulWidget {
  @override
  __MyBottomNavigationBarState createState() => __MyBottomNavigationBarState();
}

class __MyBottomNavigationBarState extends State<_MyBottomNavigationBar> {
  int selectIndex = 1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 60,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black,
          blurRadius: 1,
          spreadRadius: -1,
        )
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ItemBottomBar(
            icon: Icons.home,
            label: 'Home',
            index: 1,
            selected: selectIndex == 1,
            onTap: onTap,
          ),
          _ItemBottomBar(
            icon: Icons.explore,
            label: 'Explore',
            index: 2,
            selected: selectIndex == 2,
            onTap: onTap,
          ),
          _ItemBottomBar(
            icon: Icons.subscriptions,
            label: 'Subscriptions',
            index: 3,
            selected: selectIndex == 3,
            onTap: onTap,
          ),
          _ItemBottomBar(
            icon: Icons.notifications,
            label: 'Notifications',
            index: 4,
            selected: selectIndex == 4,
            onTap: onTap,
          ),
          _ItemBottomBar(
            icon: Icons.play_circle_filled,
            label: 'Library',
            index: 5,
            selected: selectIndex == 5,
            onTap: onTap,
          ),
        ],
      ),
    );
  }

  void onTap(int index) {
    selectIndex = index;
    setState(() {});
  }
}

class _ItemBottomBar extends StatelessWidget {
  final IconData icon;

  final String label;

  final bool selected;
  final int index;
  final Function(int) onTap;

  _ItemBottomBar({
    this.icon,
    this.label,
    this.selected = false,
    this.index,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: selected ? Colors.red[800] : Colors.grey[700]),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: selected ? Colors.red[800] : Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}

/*BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            label: 'Subscriptions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.red[700],
        onTap: (index) {},
      )*/

class _ItemList extends StatelessWidget {
  final InfoVideo infoVideo;

  _ItemList(this.infoVideo);

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
              color: Colors.green,
              child: FadeInImage(
                placeholder: AssetImage(kLoadingImage),
                image: NetworkImage('https://picsum.photos/500/300'),
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
