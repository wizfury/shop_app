import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.lato().fontFamily,
      
      primaryTextTheme: GoogleFonts.latoTextTheme(),
      
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(color: Colors.black),
        centerTitle: true,
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        
        
      ));

    static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      );
}
