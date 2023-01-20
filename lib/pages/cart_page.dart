import 'package:flutter/material.dart';
import 'package:shop_app/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Cart").text.xl.bold.color(MyTheme.darkbluishcolor).make()),
      ),

      backgroundColor: MyTheme.creamcolor,
    );
  }
}