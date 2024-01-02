import 'package:flutter/material.dart';

class ImageNetworkWidget extends StatelessWidget {


  ImageNetworkWidget({
    super.key,
    required this.url,
    required this.height,
    required this.width
  });

  String url;
  double width;
  double height;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[200],
      child: Image.network(
        url,
        fit: BoxFit.cover,
      ),
    );
  }
}