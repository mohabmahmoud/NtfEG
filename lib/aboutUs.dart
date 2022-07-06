import 'package:flutter/material.dart';

import 'Helpers/Helper.dart';
import 'constant.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backGroundDecoration(),
      child: Scaffold(
        appBar: customAppBar("عن التطبــيق", context, false),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),

                SizedBox(
                  height: 30,
                ),
                customTxt(
               "يحتوى التطبيق على  متابعة فعاليات \n المهرجان القومي للمسرح المصري"
                    ,
                    Colors.white),
                SizedBox(
                  height: 30,
                ),
                Helper.IsArabic? customTxt(
                    "يشمل التطبيق على اخبار المهرجان والاصدارات والنشرات وجدول العروض والندوات والورش و معلومات عن فريق عمل المهرجان وصفحة الفيسبوك وحساب الانستجرام وقناة اليوتيوب الخاصة بالمهرجان\n كما يحتوى على اشعارات تصل للمستخدم على هاتفه لتنبيهه باحدث الاخبار وفعاليات المهرجان",
                    Colors.white):Container(),
                SizedBox(
                  height: 40,
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color:   Colors.red.withOpacity(.7),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child:
                    InkWell(onTap:(){


                      launchURL("https://www.facebook.com/mohamed.fadel.elkabany");

                    },child:
                    customTxt(
                        "مدير الموقع الالكتروني و السوشيال ميديا"+"\n"+
                        "محمد فاضل القبانى"

                        ,
                        Colors.white)
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color:  Colors.red.withOpacity(.7),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: InkWell(onTap:(){


                      launchURL("https://www.facebook.com/trends4adv");

                    },child:
                    customTxt(
                       "تم تصميم التطبيق بواسطة\n  مؤسسة اتجاهات للاعلان",
                        Colors.white),
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
