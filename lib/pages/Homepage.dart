// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:shop_app/models/catalog.dart';
import 'package:shop_app/widgets/drawer.dart';
import 'package:shop_app/widgets/item_widget.dart';
import 'package:shop_app/widgets/theme.dart';

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
      backgroundColor: MyTheme.creamcolor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppHeader(),
              if (catalogModel.items != null && catalogModel.items.isNotEmpty)
                AppList().expand()
              else
                Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}

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

class AppList extends StatelessWidget {
  const AppList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: ((context, index) {
        final catalog = catalogModel.items[index];
        return catalogItem(catalog: catalog);
      }),
      itemCount: catalogModel.items.length,
    );
  }
}

class catalogItem extends StatelessWidget {
  final Item catalog;
  const catalogItem({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        catalogImage(image: catalog.image),
        Expanded(child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            catalog.name.text.bold.color(MyTheme.darkbluishcolor).make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            ButtonBar(
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                ElevatedButton(onPressed: () {}, child: "Buy".text.make())
              ],
            )
          ],
        ))
      ],
    )).white.rounded.square(100).make().p16();
  }
}

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
