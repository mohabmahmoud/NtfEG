import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'Helpers/Helper.dart';
import 'Ui/Home/Home.dart';
import 'Ui/Notification/notifications.dart';
import 'homepage.dart';
import 'styles/apptheme.dart';
import 'package:flutter/services.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print(Helper.GetCurrentTextDirection());

  runApp(
     MyApp()
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
  ));
}


class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Main',
      home:

         SkeletonTheme(
        // themeMode: ThemeMode.light,
        shimmerGradient: LinearGradient(
        colors: [
          Colors.red.withOpacity(.6),
          Colors.grey.withOpacity(.5),
    ],
    stops: [
    0.1,
    0.5,
    0.9,
    ],
    ),
    darkShimmerGradient: LinearGradient(
    colors: [
      Colors.red.withOpacity(.6),
      Colors.grey.withOpacity(.5),
    ],
    stops: [
    0.0,
    0.2,
    0.5,
    0.8,
    1,
    ],
    begin: Alignment(-2.4, -0.2),
    end: Alignment(2.4, 0.2),
    tileMode: TileMode.clamp,
    ),
    child:
      MyHomePage()),
      theme: appTheme.apptheme,
      debugShowCheckedModeBanner: false,
      navigatorKey: Helper.materialKey,
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((val) {
      if (val != null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Notifications("Notifications", "Notifications");
        },));
      }
      });




















    Timer(
        Duration(seconds: 6),
        () async{
          Helper.HelperInit(context);
         // Helper.Dic=await Helper.getJson();
          try {
             FirebaseMessaging.instance.subscribeToTopic("allDevices");
             print("mohab");
          }catch(Excpation){
            print(Excpation.toString());
            print(FirebaseMessaging.instance.getToken());
          }
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
            return Home();
          }));




        });
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        backgroundColor: Colors.white,
        body: Center(child:Container(width: MediaQuery.of(context).size.width,
            color: Colors.white, child: Image.asset("assets/Logo.gif",fit: BoxFit.fitWidth,))));


  }
}
