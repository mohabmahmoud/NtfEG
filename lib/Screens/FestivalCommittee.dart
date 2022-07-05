import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../constant.dart';
class FestvailCommittee extends StatefulWidget {
  @override
  _FestvailCommitteeState createState() => _FestvailCommitteeState();
}

class _FestvailCommitteeState extends State<FestvailCommittee> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backGroundDecoration(),
      child: Scaffold(
        appBar: customAppBar(true?"رؤساء اللجان": "Festival Committees", context, false),
        backgroundColor: Colors.transparent,
        body:

    StreamBuilder(
    stream: FirebaseFirestore.instance.collection('FestivalCommittee').snapshots(),

    builder: (BuildContext context, AsyncSnapshot Snap) {
    if (Snap.hasData) {

    return    Center(
          child: Container(
              child: PhotoViewGallery.builder(
                scrollPhysics: const BouncingScrollPhysics(),
                builder: (BuildContext context, int index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: NetworkImage(Snap.data.documents[index].get('Image')),
                    initialScale: PhotoViewComputedScale.contained,
                    heroAttributes:
                    PhotoViewHeroAttributes(tag: Snap.data.documents[index].get('Image')),
                  );
                },
                itemCount: Snap.data.documents.length,
                loadingBuilder: (context, event) => Center(
                  child: Container(
                    width: 20.0,
                    height: 20.0,
                    child: CircularProgressIndicator(

                    ),
                  ),
                ),
                backgroundDecoration: backGroundDecoration(),
              )),
        );}else{

      return CircularProgressIndicator();
    }})
      ),
    );
  }
  }

