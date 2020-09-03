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
    );
  }
}

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
