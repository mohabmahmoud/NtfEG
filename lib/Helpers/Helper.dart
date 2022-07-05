import 'dart:convert';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../styles/widthandheight.dart';

 class Helper{
   static SharedPreferences ?sharedPreferences;
   static var Dic;
   static double sW=0;
   static double sH=0;
   static double OuterPadding=0;
   static double InnerPadding=0;
   static double BorderRadius=0;
   static double SpaceM=0;
   static double SpaceX=0;
   static bool IsArabic=true;
   static GlobalKey<NavigatorState> materialKey=new GlobalKey();
   static final Helper _singleton = Helper()._internal();

   factory Helper(){
     return _singleton;
   }
   _internal(){


   }

   static HelperInit(BuildContext context){
     Helper.sW=getwidth(context);
     Helper.sH=getheight(context);
     Helper.OuterPadding=8;
     Helper.InnerPadding=4;
     Helper.BorderRadius=4;
     Helper.SpaceM=5;
     Helper.SpaceX=8;

   }
   static bool GetCurrentLangage(){
     if(sharedPreferences!.getBool('Lang')!=null){
       IsArabic=sharedPreferences!.getBool('Lang')!;
       return  IsArabic;
     }else{

       IsArabic=(ui.window.locale.languageCode=='ar')?true:false;
       return IsArabic;
     }

   }
   static  GetCurrentTextDirection(){
     return (GetCurrentLangage()==true)?ui.TextDirection.rtl:ui.TextDirection.ltr;
   }

   static getJson() async{
     return  json.decode(await rootBundle.loadString((GetCurrentLangage()!=false)?'Dic/Ar.json':'Dic/En.Json'));
   }

 }