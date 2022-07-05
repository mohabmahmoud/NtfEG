import 'package:flutter/material.dart';

class MenuItem{
  int Id=0;
  String  NameAr="";
  String  NameEn="";
  String Url="";
  late Widget Screen;
  int Type=0;
  late IconData Icondata;
  MenuItem( int id, String nameAr, String nameEn, String url,onpress, int type, IconData icondata){
    this.Id=id;
    this.NameAr=nameAr;
    this.NameEn=nameEn;
    this.Url=url;
    this.Screen=onpress;
    this.Type=type;
    this.Icondata=icondata;

  }
  String GetName(BuildContext context){

    return  true?NameAr:NameEn;

  }






}