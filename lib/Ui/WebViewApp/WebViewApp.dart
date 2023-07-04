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

  WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
  NavigationDelegate(
  onProgress: (int progress) {
  // Update loading bar.
  },
  onPageStarted: (String url) {},
  onPageFinished: (String url) {},
  onWebResourceError: (WebResourceError error) {},
  onNavigationRequest: (NavigationRequest request) {
  if (request.url.startsWith('https://www.youtube.com/')) {
  return NavigationDecision.prevent;
  }
  return NavigationDecision.navigate;
  },
  ),
  )
  ;

  @override
  void initState() {
    controller.loadRequest(Uri.parse(widget.Link));
    super.initState();
    // Enable virtual display.
  }
  bool isLoading=true;

  @override
  Widget build(BuildContext context) {
    print(widget.Link);
    return Scaffold( backgroundColor: Colors.transparent,appBar:customAppBar(widget.Name, context, false),body:
    WebViewWidget(controller: controller),

   );
  }
}