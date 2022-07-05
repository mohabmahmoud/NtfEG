import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Helpers/Helper.dart';
import 'Screens/PdfViewer.dart';
import 'constant.dart';

class Programmes extends StatefulWidget {
  String CollectionName;
  String Name;
  Programmes(this.CollectionName,this.Name);
  @override
  _ProgrammesState createState() => _ProgrammesState();
}

var tableContentList = [
  "فعاليـات اليـوم",
  "جدول النــدوات",
  "جدول الــورش",
  "جدول العــروض"
];
var tableenContentList = [
  "Events-Today",
  "Seminars",
  "Workshops",
  "Performances",

];

var tableContentIconsList = [
  FontAwesomeIcons.calendar,
  FontAwesomeIcons.bookReader,
  FontAwesomeIcons.chalkboardTeacher,
  Icons.theater_comedy
];

class _ProgrammesState extends State<Programmes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backGroundDecoration(),
      child: Scaffold(
        appBar: customAppBar(widget.Name ,context, false),
        backgroundColor: Colors.transparent,
        body:
    StreamBuilder(
    stream: FirebaseFirestore.instance.collection(widget.CollectionName).snapshots(),

    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> Snap) {
    if (Snap.hasData) {
   return GridView.count(
    crossAxisCount: 2,
    children: List.generate(tableContentList.length, (index) {
    return GestureDetector(
    onTap: () {
      print(Snap.data!.docs[0].data());
      print(Snap.data!.docs.length);


    },
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    FaIcon(
    tableContentIconsList[index],
    size: 50,
    color: Colors.white,
    ),
    SizedBox(
    height: 10,
    ),
    customTxt(Helper.IsArabic?tableContentList[index]:tableenContentList[index], Colors.white),
    ],
    ),
    );
    }),
    );

    }
    else{

      return CircularProgressIndicator();
    }
    })

        ),
    );
  }
}
