import 'package:flutter/material.dart';
import 'package:shop_app/models/catalog.dart';
import 'package:shop_app/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({super.key, required this.catalog}) : assert(catalog!=null);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
        Container(
          
          child: Hero(
            tag: Key(catalog.id.toString()),
            child: Image.network(catalog.image)).p16()).centered().expand(),

        Expanded(
          child: VxArc(
            height: 20.0,
            arcType: VxArcType.CONVEY,
            edge: VxEdge.TOP,
            
            child: Container(
              color: MyTheme.creamcolor,
              width: context.screenWidth,
              child: Column(children: [
                catalog.name.text.xl4.color(MyTheme.darkbluishcolor).bold.make(),

                catalog.desc.text.sm.color(MyTheme.darkbluishcolor).make()
              ]).p64(),
              
              )))
      
      ]),

      
    );
  }
}
