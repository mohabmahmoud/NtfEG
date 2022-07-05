import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Screens/PdfViewer.dart';
import 'ViewModels/TheatreMap.dart';
import 'constant.dart';
import 'styles/widthandheight.dart';

class TheatreLocations extends StatefulWidget {
  @override
  _TheatreLocationsState createState() => _TheatreLocationsState();
}



class _TheatreLocationsState extends State<TheatreLocations> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backGroundDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: customAppBar(true?"خرائط المسـارح":"Maps for Theaters", context, false),
        body:
            StreamBuilder(
                stream: FirebaseFirestore.instance.collection('Maps').snapshots(),

                builder: (BuildContext context, AsyncSnapshot Snap) {
                  if (Snap.hasData) {

                    return ListView.builder(
                        itemCount: Snap.data.documents.length,itemBuilder: (context,index){
                      return
                        InkWell(onTap: ()async{

                          await launch(Snap.data.documents[index].get("Url"));
                        },child:Card(elevation:4,child:


                        Container(alignment: Alignment.center,width:getwidth(context),height: 40,child: Text(Snap.data.documents[index].get(true?'NameAr':'NameEn'),style:TextStyle(fontSize: 16,fontWeight: FontWeight.w700),))

                        )

                        );



                    });}
                  else{

                    return CircularProgressIndicator();    }
                }





            )),




    );
  }
}
