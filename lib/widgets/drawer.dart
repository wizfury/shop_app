import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';
import 'package:shop_app/widgets/theme.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: MyTheme.creamcolor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
              ),
              title: Text(
                "Home",
                style: TextStyle(),
                textScaleFactor: 1,
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled),
              title: Text("profile"),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail),
              title: Text("Email me"),
            )
          ],
        ),
      ),
    );
  }
}
