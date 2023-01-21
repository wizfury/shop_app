// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:shop_app/models/catalog.dart';
import 'package:shop_app/widgets/drawer.dart';
import 'package:shop_app/widgets/item_widget.dart';
import 'package:shop_app/widgets/theme.dart';
import 'package:shop_app/widgets/home_widget/app_header.dart';

import '../widgets/home_widget/app_list.dart';
import 'package:cupertino_icons/cupertino_icons.dart';


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
    await Future.delayed(Duration(seconds: 1));
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
      appBar: AppBar(),
      drawer: Drawer(),
      backgroundColor: MyTheme.creamcolor,
    
      body: SafeArea(
        bottom: false,
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppHeader(),
              if (catalogModel.items != null && catalogModel.items.isNotEmpty)
                AppList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
        
      ), 
    );
  }
}

