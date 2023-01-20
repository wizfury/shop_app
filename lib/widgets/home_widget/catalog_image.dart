import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class catalogImage extends StatelessWidget {
  final String image;
  const catalogImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image).box.make().p16();
  }
}
