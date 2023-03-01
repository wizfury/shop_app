import 'package:flutter/material.dart';
import 'package:shop_app/models/catalog.dart';
import 'package:shop_app/utils/routes.dart';
import 'package:shop_app/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({super.key, required this.catalog})
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: Vx.mOnly(right: 16),
        children: [
          "\$${catalog.price}".text.color(Colors.red).bold.xl2.make(),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.orderRoute, arguments: {
                'item': catalog.name,
                'price': catalog.price,
              });
            },
            child: "Buy".text.make(),
            style: ButtonStyle(
                shape: MaterialStateProperty.all(StadiumBorder()),
                backgroundColor:
                    MaterialStateProperty.all(MyTheme.darkbluishcolor)),
          ).wh(90, 40)
        ],
      ).p16(),
      backgroundColor: Colors.white,
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
                child: Hero(
                        tag: Key(catalog.id.toString()),
                        child: Image.network(catalog.image))
                    .p16())
            .centered()
            .expand(),
        Expanded(
            child: VxArc(
                height: 20.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: MyTheme.creamcolor,
                  width: context.screenWidth,
                  child: Column(children: [
                    catalog.name.text.xl4
                        .color(MyTheme.darkbluishcolor)
                        .bold
                        .make(),
                    catalog.desc.text.sm.color(MyTheme.darkbluishcolor).make()
                  ]).p64(),
                )))
      ]),
    );
  }
}
