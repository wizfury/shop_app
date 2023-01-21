import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/catalog.dart';
import 'package:shop_app/pages/home_detail.dart';
import 'package:shop_app/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:shop_app/widgets/home_widget/catalog_image.dart';

import '../theme.dart';

class AppList extends StatelessWidget {
  const AppList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: ((context, index) {
        final catalog = catalogModel.items[index];
        return InkWell(
            onTap: (() => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catalog: catalog)))),
            child: catalogItem(catalog: catalog));
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
        Hero(
            tag: Key(catalog.id.toString()),
            child: catalogImage(image: catalog.image)),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            catalog.name.text.bold
                .color(MyTheme.darkbluishcolor)
                .make()
                .pOnly(top: 10),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.mOnly(right: 16),
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.orderRoute);
                  },
                  child: "Buy".text.make(),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(StadiumBorder()),
                      backgroundColor:
                          MaterialStateProperty.all(MyTheme.darkbluishcolor)),
                )
              ],
            ).p2()
          ],
        ))
      ],
    )).white.rounded.square(100).make().p16();
  }
}
