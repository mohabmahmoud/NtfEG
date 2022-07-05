import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Helpers/Helper.dart';
import '../../constant.dart';
import '../../styles/widthandheight.dart';

class TheatreLocations extends StatefulWidget {
  String CollectionName;
  String Title;
  TheatreLocations(this.CollectionName,this.Title);

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
        appBar: customAppBar(widget.Title, context, false),
        body:
            StreamBuilder(
                stream: FirebaseFirestore.instance.collection(widget.CollectionName).orderBy('Index',descending: false).snapshots(),

                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> Snap) {
                  if (Snap.hasData) {

                    return ListView.builder(
                        itemCount: Snap.data!.docs.length,itemBuilder: (context,index){
                      return
                        InkWell(onTap: ()async{

                          await launch(Snap.data!.docs[index].get("Url"));
                        },child:Card(elevation:4,child:


                        Container(alignment: Alignment.center,width:getwidth(context),height: 40,child: Text(Snap.data!.docs[index].get(Helper.IsArabic?'NameAr':'NameEn'),style:TextStyle(fontSize: 16,fontWeight: FontWeight.w700),))

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
