import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import 'constant.dart';

class NewsPeople extends StatefulWidget {
  @override
  _NewsPeopleState createState() => _NewsPeopleState();
}


class _NewsPeopleState extends State<NewsPeople> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backGroundDecoration(),
      child: Scaffold(
        appBar: customAppBar(true?"لجنة التحكيم":"Jury Members", context, false),
        backgroundColor: Colors.transparent,
        body: Center(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('NewsPeople').snapshots(),

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
                }}),
        ),
      ),
    );
  }
}
