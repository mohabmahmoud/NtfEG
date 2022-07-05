import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../constant.dart';
import '../styles/widthandheight.dart';

class PdfViewer extends StatefulWidget {
  String PdfPath;
  PdfViewer(this.PdfPath);
  @override
  _PdfViewerState createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
          decoration: backGroundDecoration(),child:

      Scaffold(appBar:customAppBar("", context, false), backgroundColor: Colors.transparent,body:


    Container(child:  SfPdfViewer.network(
     widget.PdfPath
    ,

    )
    )



    ));
  }
}
