import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../styles/widthandheight.dart';
import 'PdfViewer.dart';
class PublicationAndNewsPaper extends StatefulWidget {
  String Collection;
  PublicationAndNewsPaper(this.Collection);

  @override
  _PublicationAndNewsPaperState createState() => _PublicationAndNewsPaperState();
}

class _PublicationAndNewsPaperState extends State<PublicationAndNewsPaper> {

  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: backGroundDecoration(),
    child:  Scaffold(
      backgroundColor: Colors.transparent,

      appBar: customAppBar(true?(widget.Collection=="NewsPaper")?"النشــرة":"الاصــدارات":widget.Collection, context, false),
      body:
      StreamBuilder(
        stream: FirebaseFirestore.instance.collection(widget.Collection).orderBy('Date',descending: false).snapshots(),

    builder: (BuildContext context, AsyncSnapshot Snap) {
    if (Snap.hasData) {


      return Container(
        child:  GridView.count(
          crossAxisCount: 2,
          childAspectRatio: (getwidth(context)*.5 / (getheight(context))*3),
          controller: new ScrollController(keepScrollOffset: true),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: Snap.data.documents.map<Widget>((value) {
            return
            Padding(padding: EdgeInsets.all(2),child:
            Column(children: [
              Container(height: getheight(context)/3-70,
                child: 
                InkWell(onTap: 
                    
                (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return PdfViewer(value.get("Pdf"));
                  }));
                  
                  
                  
                }
                    ,child:
                
                Image.network(value.get("Image"))),
              ),

              Container(alignment: Alignment.topCenter,child:
              ListTile(title: Text(value.get("NameAr"),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),)
            )

            ],));







          }).toList(),
        ),
      );}
    else{


    return CircularProgressIndicator();
    }
        }


    ),
    ));
  }
}
