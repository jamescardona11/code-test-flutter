import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_ui_app/provider/navigation_provider.dart';

class MyBottomNavigationBar extends StatelessWidget {
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
          ),
          _ItemBottomBar(
            icon: Icons.explore,
            label: 'Explore',
            index: 2,
          ),
          _ItemBottomBar(
            icon: Icons.subscriptions,
            label: 'Subscriptions',
            index: 3,
          ),
          _ItemBottomBar(
            icon: Icons.notifications,
            label: 'Notifications',
            index: 4,
          ),
          _ItemBottomBar(
            icon: Icons.play_circle_filled,
            label: 'Library',
            index: 5,
          ),
        ],
      ),
    );
  }
}

class _ItemBottomBar extends StatelessWidget {
  final IconData icon;
  final String label;
  final int index;

  _ItemBottomBar({
    this.icon,
    this.label,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    final selectIndex = Provider.of<NavigationProvider>(context).indexSelected;

    return GestureDetector(
      onTap: () => Provider.of<NavigationProvider>(context, listen: false).onChangeIndex(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: selectIndex == index ? Colors.red[800] : Colors.grey[700]),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: selectIndex == index ? Colors.red[800] : Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}
