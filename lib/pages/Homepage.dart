import 'dart:html';
import 'dart:ui';

import 'package:shop_app/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    await Future.delayed(Duration(seconds: 2));
    var catalogjason = await rootBundle.loadString("assets/files/catalog.json");
    var decodeData = jsonDecode(catalogjason);
    var productData = decodeData["products"];
    catalogModel.items =
        List.from(productData).map((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            AppHeader(),
          ],),
        ),
      )






    //   body: Padding(
    //       padding: EdgeInsets.all(20),
    //       child: (catalogModel.items != null && catalogModel.items.isNotEmpty)
    //           ? GridView.builder(
    //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //                   crossAxisCount: 2,
    //                   mainAxisSpacing: 20,
    //                   crossAxisSpacing: 20, 
    //                   ),
    //               itemBuilder: ((context, index) {
    //                 final item = catalogModel.items[index];
    //                 return Card(
    //                     clipBehavior: Clip.antiAlias,
    //                     shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(20)),
    //                     child: GridTile(
    //                       header: Container(
    //                         padding: const EdgeInsets.all(10),
    //                         decoration: BoxDecoration(
    //                           color: Colors.blue
    //                         ),
    //                         child: Text(item.name,style: TextStyle(color: Colors.white),)),
    //                       child: Image.network(item.image),
    //                       footer: Container(
    //                         padding: EdgeInsets.all(10),
    //                         color: Colors.black,
    //                         child: Center(
    //                           child: Text("\$${item.price}",style: TextStyle(color: Colors.white),))),
    //                     ));
    //               }),
    //               itemCount: catalogModel.items.length,
    //             )
    //           : Center(
    //               child: CircularProgressIndicator(),
    //             )),
    //   drawer: MyDrawer(),
    );
  }
}

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            "Shop App".text.xl5.bold.color(MyTheme.darkbluishcolor).make(),
            "Tranding products".text.bold.make(),
          ],);
  }
}