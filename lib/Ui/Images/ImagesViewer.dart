import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../styles/widthandheight.dart';
import '../PhotoGrid/SinglePhotoView.dart';

class ImageViewer extends StatefulWidget {
  String Collection;
  String Name;
  ImageViewer(this.Collection,this.Name);

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
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
                  print(Snap.data!.docs.length);
                  print(                  widget.Collection
                  );

                  return Builder(
                    builder: (context) {
                      final double height = MediaQuery.of(context).size.height;
                      return CarouselSlider(

                        options: CarouselOptions(
                          aspectRatio:5.0,
                          pageSnapping: true,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                          autoPlay: true,
                          height: getheight(context),


                        ),
                        items: Snap.data!.docs
                            .map<Widget>((item) => Container(height:getheight(context),
                          child: Center(
                              child:


                                  InkWell(child:
                                      Hero(child:
                              CachedNetworkImage(
                                imageUrl:
                                item.get("Image"),
                                placeholder: (context, url) => CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                              ),tag:item.get("Image") ),
                                  onTap: (){

                          Navigator.push(context, MaterialPageRoute(builder: (context){
                          return SinglePhotoView(item.get("Image"));
                          }));
                          },

                                  ),


                             ),
                        ))
                            .toList(),
                      );
                    },
                  );


                }else{

                  return Center(child:CircularProgressIndicator());
                }
              })


      ));
  }
  String getAr(){

    return true?"Ar":"";

  }
}
