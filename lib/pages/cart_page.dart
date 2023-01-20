import 'package:flutter/material.dart';
import 'package:shop_app/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamcolor,
      appBar: AppBar(
        title: Center(child: Text("Cart").text.xl.bold.color(MyTheme.creamcolor).make()),
      ),

    body: Column(children: [
      Placeholder().p32().expand(),

    ]),

      
    );
  }
}