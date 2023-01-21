import 'package:flutter/material.dart';
import 'package:shop_app/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final addressController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: MyTheme.creamcolor),
        backgroundColor: MyTheme.darkbluishcolor,
        title: "Checkout".text.bold.xl.color(MyTheme.creamcolor).make(),
      ),
      body: Column(
        children: [
          Container(
            child: Image.asset("assets/images/order.png"),
          ),
          Container(
            color: MyTheme.creamcolor,
            child: Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_circle),
                    hintText: 'Name',
                  ),
                ),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.email_outlined),
                    hintText: 'Email',
                  ),
                ),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.delivery_dining_outlined),
                    hintText: 'Delivery Address',
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Order"),
                )
              ],
            ).centered()),
          ),
        ],
      ),
    );
  }
}
