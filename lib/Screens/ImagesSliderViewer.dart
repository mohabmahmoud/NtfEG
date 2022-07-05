import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../styles/widthandheight.dart';
class ImagesSliderViewer extends StatefulWidget {
  String Collection;
  String NameAr;
  ImagesSliderViewer(this.Collection,this.NameAr);

  @override
  _ImagesSliderViewerState createState() => _ImagesSliderViewerState();
}

class _ImagesSliderViewerState extends State<ImagesSliderViewer> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
        decoration: backGroundDecoration(),child:
      Scaffold(
        appBar: customAppBar(true?widget.NameAr:widget.Collection, context, false),

      backgroundColor: Colors.transparent,
      body:




      StreamBuilder(
        stream: FirebaseFirestore.instance.collection(widget.Collection+getAr()).orderBy('Date',descending: false).snapshots(),

    builder: (BuildContext context, AsyncSnapshot Snap) {
    if (Snap.hasData) {


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
      items: Snap.data.documents
          .map<Widget>((item) => Container(height:getheight(context),
        child: Center(
            child: Image.network(
              item.get("Image"),
              fit: BoxFit.contain,
              height: height,
            )),
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
