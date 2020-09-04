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
      body: Container(
        width: size.width,
        height: size.height,
        decoration: kDecorationDetail,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _ImageVideo(index: index),
            _InfoVideo(infoVideo: infoVideo),
            _ActionBar(),
            _SubscribeBar(infoVideo: infoVideo),
            SizedBox(height: 50),
            Center(
              child: Text('loading comments...'),
            )
          ],
        ),
      ),
    );
  }
}

class _SubscribeBar extends StatelessWidget {
  const _SubscribeBar({
    Key key,
    @required this.infoVideo,
  }) : super(key: key);

  final InfoVideo infoVideo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: kDecorationDetail,
      child: Row(
        children: [
          ImageProfile(),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                infoVideo.nameVideo,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
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
          Text(
            'SUBSCRIBE',
            style: TextStyle(
              fontSize: 15,
              color: Colors.red[800],
              fontWeight: FontWeight.bold,
            ),
          ),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
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
    return Container(
      child: FadeInImage(
        placeholder: AssetImage(kLoadingImage),
        image: NetworkImage('https://picsum.photos/500/300?index=${index + 1}'),
      ),
      width: size.width,
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
