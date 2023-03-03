// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shop_app/models/cart_model.dart';

import 'package:shop_app/models/catalog.dart';
import 'package:shop_app/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class cartPage extends StatelessWidget {
  const cartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cartModel(id: '001', name: 'XYZ', price: 23.33);

    return Scaffold(
      backgroundColor: MyTheme.creamcolor,
      appBar: AppBar(
        
        title: Text("Cart",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Column(children: [
          _cartList().p32().expand(),
          Divider(),
          _cartTotal(),
        ]),
      ),
    );
  }
}
class _cartTotal extends StatelessWidget {
  const _cartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        
        children: [
        
        "\$999".text.make(),
        ElevatedButton(
          style: ButtonStyle(
            
            backgroundColor: MaterialStateProperty.all(MyTheme.darkbluishcolor)),
          onPressed: (){}, child: "Buy".text.make()).w32(context)
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
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder:(context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(
            Icons.remove_circle_outline_outlined
            ), onPressed: () { ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Buying not Supported Yet")));  },),
          title: "item1".text.make(),
      ),);
  }
}
