import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/pages/cartpage.dart';
import 'package:shop_app/pages/order_page.dart';
import 'package:shop_app/widgets/theme.dart';
import 'pages/Homepage.dart';
import 'pages/login_page.dart';
import 'utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main(List<String> args) {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),  
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => loginPage(),
        MyRoutes.homeRoute: (context) => Homepage(),
        MyRoutes.loginRoute: (context) => loginPage(),
        MyRoutes.orderRoute:(context) => OrderPage(),
        MyRoutes.cartRoute:(context) => cartPage(),
      },
      
    );
  }
}
