import 'package:flutter/material.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamcolor,
      appBar: AppBar(
        title: Center(
            child: Text("Cart").text.xl.bold.color(MyTheme.creamcolor).make()),
      ),
      body: Column(children: [
        _cartList().p32().expand(),
        Divider(),
        _cartTotal(),
      ]),
    );
  }
}

class _cartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        "\$${_cart.totalprice}".text.xl5.color(MyTheme.darkbluishcolor).make(),
        30.widthBox,
        ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: "Buying not supported yet".text.make()));
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(MyTheme.darkbluishcolor)),
            child: Text("+cart")),
      ]),
    );
  }
}

class _cartList extends StatefulWidget {
  const _cartList({super.key});

  @override
  State<_cartList> createState() => __cartListState();
}

class __cartListState extends State<_cartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _cart.items?.length,
        itemBuilder: ((context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: (() {}),
              ),
              title: _cart.items[index].name.text.make(),
            )));
  }
}
