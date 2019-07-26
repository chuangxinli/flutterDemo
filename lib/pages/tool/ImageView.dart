import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageView extends StatelessWidget {
  const ImageView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context).settings.arguments;
    String imgUrl = args['imgUrl'];
    return GestureDetector( 
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
      child: PhotoView(
        imageProvider: AssetImage(imgUrl),
      ),
    ),
    );
  }
}
