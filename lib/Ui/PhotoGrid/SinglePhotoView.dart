import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';

import '../../constant.dart';

class SinglePhotoView extends StatefulWidget {
  String Image;
  SinglePhotoView(this.Image);
  @override
  _SinglePhotoViewState createState() => _SinglePhotoViewState();
}

class _SinglePhotoViewState extends State<SinglePhotoView> {
  @override
  Widget build(BuildContext context) {
    return Hero(tag: widget.Image, child:
    Container(
    decoration: backGroundDecoration(),
    child:
    Scaffold(
      backgroundColor: Colors.transparent,

      appBar: customAppBar("", context, false,text: InkWell(
        onTap: ()async{


          try {
            // Saved with this method.
            var imageId = await ImageDownloader.downloadImage(widget.Image);
            if (imageId == null) {
              return;
            }

            // Below is a method of obtaining saved image information.
            var fileName = await ImageDownloader.findName(imageId);
            var path = await ImageDownloader.findPath(imageId);
            var size = await ImageDownloader.findByteSize(imageId);
            var mimeType = await ImageDownloader.findMimeType(imageId);
          } on PlatformException catch (error) {
            print(error);
          }



        }


      ,child: Text("  Save  ",style: TextStyle(fontSize: 18,color: Colors.white)),)),body:

        Center(child:
            Container(decoration: BoxDecoration(border: Border.all(color: Colors.white,width: 2)),child:


    CachedNetworkImage(
      imageUrl:widget.Image,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    )),
        )

    )));
  }
}
