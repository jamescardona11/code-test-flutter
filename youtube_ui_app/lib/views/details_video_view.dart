import 'package:flutter/material.dart';
import 'package:youtube_ui_app/constants.dart';
import 'package:youtube_ui_app/widgets/item_list.dart';

class DetailVideoView extends StatelessWidget {
  final InfoVideo infoVideo;
  final int index;

  DetailVideoView(this.infoVideo, this.index);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.55,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  spreadRadius: -4,
                  blurRadius: 4,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _ImageVideo(index: index),
                _InfoVideo(infoVideo: infoVideo),
                _ActionBar(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ActionBar extends StatelessWidget {
  const _ActionBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ActionItem(icon: Icons.add, label: '128K'),
          _ActionItem(icon: Icons.indeterminate_check_box, label: '1.9K'),
          _ActionItem(icon: Icons.share, label: 'Share'),
          _ActionItem(icon: Icons.save_alt_rounded, label: 'Download'),
          _ActionItem(icon: Icons.add_to_photos, label: 'Save'),
        ],
      ),
    );
  }
}

class _InfoVideo extends StatelessWidget {
  const _InfoVideo({
    Key key,
    @required this.infoVideo,
  }) : super(key: key);

  final InfoVideo infoVideo;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
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
                Text(infoVideo.concatValues, style: TextStyle(color: Colors.grey, fontSize: 14)),
              ],
            ),
          ],
        ),
      ),
      flex: 2,
    );
  }
}

class _ImageVideo extends StatelessWidget {
  const _ImageVideo({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Flexible(
      child: Container(
        child: FadeInImage(
          placeholder: AssetImage(kLoadingImage),
          image: NetworkImage('https://picsum.photos/500/300?index=${index + 1}'),
        ),
        width: size.width,
      ),
      flex: 6,
    );
  }
}

class _ActionItem extends StatelessWidget {
  final IconData icon;
  final String label;

  _ActionItem({
    this.icon,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.grey[700]),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}
