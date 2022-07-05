import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../Helpers/Helper.dart';
import '../../Screens/PdfViewer.dart';
import '../../constant.dart';


class Pdfs extends StatefulWidget {
  String Collection;
  String Title;
  Pdfs(this.Collection,this.Title);
  @override
  _PdfsState createState() => _PdfsState();
}

class _PdfsState extends State<Pdfs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backGroundDecoration(),child:Scaffold(appBar:customAppBar(widget.Title, context, false),          backgroundColor: Colors.transparent,
      body:
    StreamBuilder(
        stream: FirebaseFirestore.instance.collection(widget.Collection).orderBy('Date',descending: false).snapshots(),

        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> Snap) {
          if (Snap.hasData) {


            return Container(
              child:  GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (Helper.sW*.5 / (Helper.sH)*3),
                controller: new ScrollController(keepScrollOffset: true),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: Snap.data!.docs.map<Widget>((value) {
                  return
                    Padding(padding: EdgeInsets.all(2),child:
                    Column(children: [
                      Container(height: Helper.sH/3-80,
                        child:
                        InkWell(onTap:

                            (){


                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PdfViewer(Snap.data!.docs[0].get("Pdf"))),
                              );


                        }
                            ,child:

                            Image.network(value.get("Image"))),
                      ),

                      Container(alignment: Alignment.topCenter,child:


                      customTxt(
                          value.get((Helper.IsArabic)?'NameAr':"NameEn")
                          ,
                          Colors.white),


                      )

                    ],));







                }).toList(),
              ),
            );}
          else{


            return CircularProgressIndicator();
          }
        }


    ))


      ,);
  }
}
