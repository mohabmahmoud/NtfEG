import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Helpers/Helper.dart';
import '../../constant.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

const _urlWebSite = 'https://www.ntfeg.org/';
const _youtube = 'https://youtube.com/channel/UCD429linqG8FD_ppnLiXXKQ';
const _facebook = 'https://www.facebook.com/ntfeg';
const _instgram = 'https://www.instagram.com/ntfegypt/';
const _mobilephone = 'tel:+201156333192';
const _mail =
    'mailto:info@ntfeg.org?subject=This is Subject Title&body=This is Body of Email';



class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backGroundDecoration(),
      child: Scaffold(
        appBar: customAppBar("تواصــل معنا", context, false),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 40.0,
                ),

                SizedBox(
                  height: 40,
                ),
                customTxt("مقر المهرجان", Colors.white),
                SizedBox(
                  height: 10,
                ),
                customTxt("المسرح القومى بالعتبة مكتب مركز المعلومات \nيومياً من الساعة العاشرة صباحاً حتى الرابعة عصراً ",
                    Colors.white,),
                SizedBox(
                  height: 30,
                ),
                customContactRow("للتواصــل من خلال البريد الالكترونى",
                    FontAwesomeIcons.mailBulk, _mail,No: true),
                SizedBox(
                  height: 10,
                ),
                customContactRow("للتواصل من خلال الاتصال",
                    FontAwesomeIcons.phone, _mobilephone,No: true),
                SizedBox(
                  height: 10,
                ),
                customContactRow("لمتابعة الموقع الاليكترونى",
                    FontAwesomeIcons.chrome, _urlWebSite),
                SizedBox(
                  height: 10,
                ),
                customContactRow("لمتابعة صفحة الفيس بوك",
                    FontAwesomeIcons.facebook, _facebook),
                SizedBox(
                  height: 10,
                ),
                customContactRow("لمتابعة حساب الانتسجرام",
                    FontAwesomeIcons.instagram, _instgram),
                SizedBox(
                  height: 10,
                ),
                customContactRow("لمتابعة قناة اليوتيوب",
                    FontAwesomeIcons.youtube, _youtube),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
