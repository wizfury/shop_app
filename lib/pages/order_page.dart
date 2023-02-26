// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:shop_app/utils/routes.dart';
import 'package:shop_app/widgets/theme.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

final nameController = TextEditingController();
final emailController = TextEditingController();
final addressController = TextEditingController();
String title = '';
int price = 0;

Future sendEmail() async {
  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  const service_id = "service_g3h0byh";
  const template_id = "template_r9og8cj";
  const user_id = "05gtatnW764-ZmYHK";
  final response = await http.post(url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "service_id": service_id,
        "template_id": template_id,
        "user_id": user_id,
        "template_params": {
          "name": nameController.text,
          "subject": "Order Placed",
          "order_type": "Cash on delivery",
          "address": addressController.text,
          "email_id": emailController.text,
          "item" : title,
          "price": price,
        },
      }));
  return response.statusCode;
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    

    
      final arguments =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      title = arguments['item'] as String;
      price = arguments['price'] as int;
    

    print(title);
    print(price);

    return Scaffold(
      backgroundColor: MyTheme.creamcolor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: MyTheme.creamcolor),
        backgroundColor: MyTheme.darkbluishcolor,
        title: "Checkout".text.bold.xl.color(MyTheme.creamcolor).make(),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                    controller: emailController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.email_outlined),
                      hintText: 'Email',
                    ),
                  ),
                  TextFormField(
                    controller: addressController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.delivery_dining_outlined),
                      hintText: 'Delivery Address',
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      sendEmail();
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: Text("Order"),
                  )
                ],
              ).centered()),
            ),
          ],
        ),
      ),
    );
  }
}
