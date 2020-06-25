import 'package:flutter/material.dart';

class CustomPhotoViewer extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  const CustomPhotoViewer({Key key, this.image, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.asset(image , fit: BoxFit.fill, height: height,
        width: width,),

    );
  }
}
