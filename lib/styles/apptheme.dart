import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class appTheme{
  static ThemeData apptheme=ThemeData(
      accentColor:Colors.white,
      appBarTheme: AppBarTheme(brightness:Brightness.dark,
      centerTitle: true,
      elevation: 0.3,textTheme: TextTheme(subtitle1:
      TextStyle(fontSize: 13,fontFamily: 'Cairo',color: Colors.white,fontWeight: FontWeight.bold)),
      iconTheme: IconThemeData(
        color:Colors.white,
      ),),
    fontFamily: 'Cairo'

  );
}