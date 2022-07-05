import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/Serialization/iconDataSerialization.dart';

import '../Helpers/Helper.dart';

 class GridItemModel{
  String NameAr="";
  String Name="";
  String NameEn="";
  String Type="";
  String Link="";
  String LangType="";
  String BackGroundIconColor="";
  Map<String, dynamic>?  IconCode= serializeIcon(IconData(0xe3af));
  IconData ?IconDataa= null;
  String IconColor="";
  String ImageLink="";
  String DescAr="";
  String DescEn="";
  String CollactionName="";
  int InAndOut=1;
  int Index=1;
  bool IsActive=true;
  File? ImageFile= null;

  static GridItemModel GetInit(){

    return  GridItemModel(
      NameAr:"",
      NameEn:"",
      Type:"Link",
      Link:"",
      LangType:"All",
      BackGroundIconColor:"fff",
      IconCode:serializeIcon(IconData(0xe3af)),
      IconColor:"",
      ImageLink:"",
      DescAr:"",
      DescEn:"",
      CollactionName:DateTime.now().toString(),
      InAndOut:1,
      Index:1,
      IsActive: true

    );
  }
  GridItemModel( {required this.NameAr,required this.NameEn,required this.Type,required this.Link,required this.LangType,required this.BackGroundIconColor,
    required this.IconCode,
    required this.IconColor,
    required this.ImageLink,
    required this.DescAr,
    required this.DescEn,
    required  this.CollactionName,
    required this.InAndOut,
    required this.Index,
    required this.IsActive  }
      );


  Map<String, dynamic> toJson() => {
    'NameAr': this.NameAr,
    'NameEn': this.NameEn,
    'Type': this.Type,
    'Index': this.Index,
    'Link': this.Link,
    'LangType': this.LangType,
    'BackGroundIconColor': this.BackGroundIconColor,
    'IconCode': this.IconCode,
    'IconColor': this.IconColor,
    'ImageLink': ImageLink,
    'DescAr': this.DescAr,
    'DescEN': this.DescEn,
    'InAndOut': this.InAndOut,
    'IsActive': this.IsActive ,
    "Date":DateTime.now(),
    "CollactionName":DateTime.now().toString()

  };
  GridItemModel.fromjson(var json){
    print(json);

    Name=(Helper.IsArabic)?json.get("NameAr"):json.get("NameEn");
    NameAr=json.get("NameAr");
    NameEn=json.get("NameEn");
    Type=json.get("Type");
    Link=json.get("Link");
    BackGroundIconColor=json.get("BackGroundIconColor");
    IconDataa=deserializeIcon(json.get("IconCode"));
    InAndOut=json.get("InAndOut");
    CollactionName=json.get("CollactionName");
    InAndOut=json.get("InAndOut");
    ImageLink=json.get("ImageLink");




  }

  getName(){

    return Helper.IsArabic?this.NameAr:this.NameEn;


  }






}