import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Screens/PdfViewer.dart';
import 'constant.dart';
import 'styles/widthandheight.dart';

class Publications extends StatefulWidget {
  @override
  _PublicationsState createState() => _PublicationsState();
}



class _PublicationsState extends State<Publications> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backGroundDecoration(),
      child: Scaffold(
        appBar: customAppBar(true?"الاصــدارات":"Publications", context, false),
        backgroundColor: Colors.transparent,
        body:

          StreamBuilder(
    stream: FirebaseFirestore.instance.collection('Publications').snapshots(),

    builder: (BuildContext context, AsyncSnapshot Snap) {
    if (Snap.hasData) {

         return GridView.builder(
             gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2)
             ,itemCount: Snap.data.documents.length,itemBuilder: (context,index){
           return
             InkWell(onTap: ()async{

               Navigator.push(context, MaterialPageRoute(builder: (context){
             return PdfViewer (Snap.data.documents[index].get('Pdf'));
              }));
             },child:Card(elevation:4,child:


                 Stack(children: [

                   Container(width: getwidth(context)/2,decoration:
                   BoxDecoration(image:
                   DecorationImage(image:
                   NetworkImage(Snap.data.documents[index].get('Image')),
                     fit: BoxFit.contain,),
                   ),),


                   Positioned(child:Container(alignment: Alignment.center,width: getwidth(context)/2,height: 30,child: Text(Snap.data.documents[index].get(true?'NameAr':'NameEn'),style:TextStyle(fontSize: 17,fontWeight: FontWeight.w700),))

                   ,bottom: 0,

                   ),


                 ],)

             )

             );



         });}
    else{

      return CircularProgressIndicator();    }
    }





    )),


    );
  }


  AddNewPublications(var PdfFile,var ImageFile,String PdfPath,String ImagePath,String Name,) async{

    FirebaseFirestore.instance.collection('Publications').add({
      'Name':Name,
      'Image':ImagePath,
      'Pdf':PdfPath,
    }).then((res) {
     print('ok');







    }).catchError((error){    print(error.toString());  });







  }










  }

