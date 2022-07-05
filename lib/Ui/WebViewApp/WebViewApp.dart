import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../constant.dart';

class WebViewExample extends StatefulWidget {
  String Link="";
  String Name="";
  WebViewExample(this.Link,this.Name);
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }
  bool isLoading=true;

  @override
  Widget build(BuildContext context) {
    print(widget.Link);
    return Scaffold( backgroundColor: Colors.transparent,appBar:customAppBar(widget.Name, context, false),body:
    Stack(children: [

      WebView(
        initialUrl: widget.Link,
        onPageFinished: (finish) {
          setState(() {
            isLoading = false;
          });
        },

        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {

        },),

      (!isLoading)?Container():Center(child:
      CircularProgressIndicator()),


    ],)
   );
  }
}