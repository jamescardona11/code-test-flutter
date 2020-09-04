import 'package:flutter/material.dart';
import 'package:youtube_ui_app/constants.dart';

class ItemList extends StatelessWidget {
  final InfoVideo infoVideo;
  final int index;

  ItemList(this.infoVideo, this.index);

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
                  ImageProfile(),
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

class ImageProfile extends StatelessWidget {
  const ImageProfile({
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
