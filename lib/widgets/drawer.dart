import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: UserAccountsDrawerHeader(
                accountName: Text("Aakarsh"),
                accountEmail: Text("aakarsh135@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avataar.png"),
                ),
              ),
            )
            ,
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                ),
                title: Text("Home",style: TextStyle(),textScaleFactor: 1,),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled
                ),title: Text("profile"),
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
