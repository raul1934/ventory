import '../../constaints.dart';
import 'package:flutter/material.dart';

class ImageNetworkLoader extends StatelessWidget {
  String imgURL;

  ImageNetworkLoader({required this.imgURL, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(imgURL, fit: BoxFit.fitWidth, loadingBuilder:
        (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
      if (loadingProgress == null) return child;

      return Center(
        child: CircularProgressIndicator(
          color: primaryColor,
          value: loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes!
              : null,
        ),
      );
    });
  }
}
