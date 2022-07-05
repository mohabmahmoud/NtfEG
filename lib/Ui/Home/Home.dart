import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../Helpers/Helper.dart';
import '../../Models/GridItemModel.dart';
import '../../constant.dart';
import '../../main.dart';
import '../../styles/widthandheight.dart';
import 'Widgets/MenuItem.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /*CollectionReference users = Firestore.instance.collection("users");

  getdata() {
    users.getDocuments().then((QuerySnapshot querySnapshot) {
      querySnapshot.documents.forEach((element) {
        print(element.data);
      });
    });
  }*/






  @override
  Widget build(BuildContext context) {
    //getdata();
    return Container(
      decoration: backGroundDecoration(),
      child: Scaffold(

        backgroundColor: Colors.transparent,
        body:
        Container(child:
        Column(children: [

          Container(height: 100,width: getwidth(context),
              decoration: BoxDecoration(color:Colors.red.withOpacity(.6) ,borderRadius: BorderRadius.all(Radius.circular(5))),

              child:
              Padding(
                  padding: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),child:


              Image.asset("assets/word.png"))

          ),












          Container(height: getheight(context)-100,child:



Directionality(child:
    StreamBuilder(stream: FirebaseFirestore.instance.collection("Items").where("LangType",whereIn: ["All",Helper.IsArabic?"Arabic":"English"]).where("IsActive",isEqualTo: true).orderBy("Index",descending: false).snapshots(),
    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if(snapshot.hasData) {

          return GridView.count(
            crossAxisCount: 2,
            children: List.generate(snapshot.data!.docs.length, (index) {
              return MenuItemApp(GridItemModel.fromjson(snapshot.data!.docs[index]));


            }));}


    else{


      return Container();
      }
    }),textDirection:(Helper.IsArabic)? TextDirection.rtl:TextDirection.ltr,)







          )
        ],)

        ),
      ),
    );
  }
  void launchURL(String _url) async {
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';}
}
