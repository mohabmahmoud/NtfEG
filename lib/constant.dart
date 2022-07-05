import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

final mainColor = Colors.blue[900];
final secondColor = Colors.red[800];
final thirdCoror = Colors.blue;
final fouthColor = Colors.yellow;




customAppBar(String title, BuildContext context, bool haveBackButton,{Widget ?text}) {
  return AppBar(
    leading: haveBackButton
        ? Container()
        : IconButton(
            icon: Icon(Icons.arrow_back, color: secondColor),
            onPressed: () => Navigator.of(context).pop(),
          ),

    title: Text(
      title,
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
    ),
    titleSpacing: 00.0,
    centerTitle: true,
    elevation: 0.00,
    backgroundColor: Colors.transparent,
actions: [
  text!=null?
      Center(child:
      text):Container()

],

  );
}

customTxt(String txt, Color color) {
  return Text(txt,textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        shadows: <Shadow>[
          Shadow(
            offset: Offset(3.0, 3.0),
            blurRadius: 3.0,
            color: Colors.black,
          ),
          Shadow(
            offset: Offset(2.0, 2.0),
            blurRadius: 8.0,
            color: Colors.grey
          ),
        ],
      ));
}

backGroundDecoration() {
  return BoxDecoration(
      image: DecorationImage(
          image: AssetImage("assets/background.jpeg"), fit: BoxFit.fill,)
      //   gradient: LinearGradient(
      // begin: Alignment.topCenter,
      // end: Alignment.bottomRight,
      // colors: [Colors.cyan, Colors.amber],
      //)
      );
}

void launchURL(String _url) async {
  print(_url);

if(Platform.isAndroid) {
  AndroidIntent intent = AndroidIntent(
    action: 'action_view',
    data: _url,

  );
  await intent.launch();

}else {
  String url=_url.substring(0,2)=="fb"?
      _url.split("=")[1]:_url;

  launchUniversalLinkIos(url);
}
}

Future<void> launchUniversalLinkIos(String Url) async  {
  Uri url=Uri.parse(Url);
  await launchUrl(
    url,
    mode: LaunchMode.inAppWebView,
  );
}


customContactRow(String txt, IconData icon, String _launcherUrl,{bool ?No}) {
  return GestureDetector(
    onTap: () async{
      if(No!=null){
        launch(_launcherUrl);
      }else{
      launchURL(_launcherUrl);
      }
    },
    child: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
          color:  Colors.red[800],

      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FaIcon(icon, size: 30, color: Colors.white),
            customTxt(txt, Colors.white),
          ],
        ),
      ),
    ),
  );
}
