import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Screens/PdfViewer.dart';
import 'constant.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

var newsTitles = [
  "فريق عمل النشره اليوميه",
  "العدد الاول ",
  "العدد الثانى",
  "العدد الثالث",
  "العدد الرابع"
];

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backGroundDecoration(),
      child: Scaffold(
        appBar: customAppBar(true?"النشــرة":"Newspaper",context, false),
        backgroundColor: Colors.transparent,
        body:  StreamBuilder(
              stream: FirebaseFirestore.instance.collection('News').snapshots(),

              builder: (BuildContext context, AsyncSnapshot Snap) {
                if (Snap.hasData) {
                  print(Snap.data);
                  return GridView.builder(
                      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2)
                      ,itemCount: Snap.data.documents.length,itemBuilder: (context,index){
                    return
                      InkWell(onTap: ()async{

                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return PdfViewer (Snap.data.documents[index].get('Pdf'));
                      }));
                    },child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.article_outlined,
                            size: 70,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          customTxt(
                              Snap.data.documents[index].get('Name')
                              ,
                              Colors.white),
                        ],
                      ));





                  });}
                else{

                  return CircularProgressIndicator();    }
              }





          )
        ),




    );
  }
  AddNews(var PdfFile,String PdfPath,String Name,) async{

    FirebaseFirestore.instance.collection('News').add({
      'Name':Name,
      'Pdf':PdfPath,
    }).then((res) {
      print('ok');







    }).catchError((error){    print(error.toString());  });







  }
}
