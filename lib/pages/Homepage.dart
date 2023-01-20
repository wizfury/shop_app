import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:shop_app/models/catalog.dart';
import 'package:shop_app/widgets/drawer.dart';
import 'package:shop_app/widgets/item_widget.dart';

void main(List<String> args) {
  runApp(Homepage());
}

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
       
    var catalogjason = await rootBundle.loadString("assets/files/catalog.json");
    var decodeData = jsonDecode(catalogjason);
    var productData = decodeData["products"];
    catalogModel.items = List.from(productData).map((item) =>Item.fromMap(item) ).toList();
    setState(() {
      
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop App"),
      ),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: catalogModel.items.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                item: catalogModel.items[index],
              );
            },
          )),
      drawer: MyDrawer(),
    );
  }
}
