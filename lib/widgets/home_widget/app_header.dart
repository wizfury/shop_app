import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

import '../theme.dart';


class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Shop App".text.xl5.bold.color(MyTheme.darkbluishcolor).make(),
        "Trending products".text.bold.make(),
      ],
    );
  }
}
