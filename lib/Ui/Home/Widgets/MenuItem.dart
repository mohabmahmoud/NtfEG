import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Helpers/Helper.dart';
import '../../../Models/GridItemModel.dart';
import '../../../Programmes.dart';
import '../../../aboutUs.dart';
import '../../../constant.dart';

import '../../Images/ImagesViewer.dart';
import '../../Notification/notifications.dart';
import '../../Pdfs/Pdfs.dart';
import '../../PhotoGrid/PhotoGrid.dart';
import '../../Theatries/theatreLocations.dart';
import '../../WebViewApp/WebViewApp.dart';
import '../../contactUs/contactUs.dart';

Widget MenuItemApp(GridItemModel Item){
  return InkWell(child:
  Padding(padding:EdgeInsets.all(5) ,child:Container(decoration: BoxDecoration(color:Colors.grey.withOpacity(.6) ,borderRadius: BorderRadius.all(Radius.circular(5))),child:Container(

      child: Container(child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Item.IconDataa,size: 45,color: Colors.white),


          SizedBox(
            height: 5,
          ),
          Center(child:
          customTxt(
             Item.getName(),
              Colors.white)),
        ],
      ),)
  ))),

    onTap: () async{

print(Item.Type);


      if(Item.Type=="Link"){
        if(Item.InAndOut==1){

          Navigator.push(Helper.materialKey.currentContext!, MaterialPageRoute(builder: ((context) {
            return WebViewExample(Item.Link,Item.Name);
          })));
        }else {

          launchURL(Item.Link);

          //launchURL(Item.Link);

        }


      }else if(Item.Type=="Photos"){
        print(Item.CollactionName);

       Navigator.push(Helper.materialKey.currentContext!, MaterialPageRoute(builder: (context) {
         return ImageViewer(Item.CollactionName,Item.Name);
       },));


      }else if(Item.Type=="PhotoGrid"){
        print(Item.CollactionName);

        Navigator.push(Helper.materialKey.currentContext!, MaterialPageRoute(builder: (context) {
          return PhotoGrid(Item.CollactionName,Item.Name);
        },));


      }




      else if(Item.Type=="Pdf"){



        Navigator.push(Helper.materialKey.currentContext!, MaterialPageRoute(builder: (context) {
          return Pdfs(Item.CollactionName,Item.getName());
        },));

      }else if(Item.Type=="Programmes"){
        Navigator.push(Helper.materialKey.currentContext!, MaterialPageRoute(builder: (context) {
          return Programmes(Item.CollactionName,Item.getName());
        },));



      }else if(Item.Type=="Maps"){
        Navigator.push(Helper.materialKey.currentContext!, MaterialPageRoute(builder: (context) {
          return TheatreLocations(Item.CollactionName,Item.getName());
        },));

      }
      else if(Item.Type=="Notifications"){
        Navigator.push(Helper.materialKey.currentContext!, MaterialPageRoute(builder: (context) {
          return Notifications(Item.CollactionName,Item.getName());
        },));

      }

      else
      if(Item.Type=="About"){
        Navigator.push(Helper.materialKey.currentContext!, MaterialPageRoute(builder: (context) {
          return AboutUs();
        },));


      }else if(Item.Type=="ContactUs"){

        Navigator.push(Helper.materialKey.currentContext!, MaterialPageRoute(builder: (context) {
          return ContactUs();
        },));

      }







    },


  );


}