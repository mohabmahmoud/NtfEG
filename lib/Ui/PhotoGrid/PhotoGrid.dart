import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

import '../../constant.dart';
import 'SinglePhotoView.dart';

class PhotoGrid extends StatefulWidget {
  String Collection;
  String Name;
  PhotoGrid(this.Collection,this.Name);

  @override
  _PhotoGridState createState() => _PhotoGridState();
}

class _PhotoGridState extends State<PhotoGrid> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
          decoration: backGroundDecoration(),child:
      Scaffold(
          appBar: customAppBar(widget.Name, context, false),

          backgroundColor: Colors.transparent,
          body:




          StreamBuilder(
              stream: FirebaseFirestore.instance.collection(widget.Collection).orderBy('Date',descending: false).snapshots(),

              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> Snap) {
                if (Snap.hasData) {

                  return GridView.count(
                  crossAxisCount: 3,
                  children: List.generate(Snap.data!.docs.length, (index) {
                    return
                    InkWell(child:

                      Padding(padding: EdgeInsets.all(4),child:
                          Container(
                          decoration: BoxDecoration(color: Colors.grey.withOpacity(.4),borderRadius: BorderRadius.circular(5))
                          ,child:


                       Hero(tag: Snap.data!.docs[index].get("Image"),child:

                       CachedNetworkImage(
                        imageUrl:
                        Snap.data!.docs[index].get("Image"),
                    placeholder: (context, url) => SizedBox(

                        child:

                        SkeletonLine(
                          style: SkeletonLineStyle(height: 150,

                              borderRadius: BorderRadius.circular(8)),
                        )
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    ),)


                    )),onTap: (){

                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return SinglePhotoView(Snap.data!.docs[index].get("Image"));
                      }));
                    },);

    }))
                  ;


                }else{

                  return Center(child:CircularProgressIndicator());
                }
              })


      ));
  }

}
