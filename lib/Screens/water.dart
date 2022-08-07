import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';


class Water extends StatefulWidget {
  @override
  _Water createState() => _Water();
}

class _Water extends State<Water> with SingleTickerProviderStateMixin{
  //TabController _controller;
  WebViewController _controller;
  String filepath= 'htmlfiles/democal.html';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('TestProject'),
      ),
      body:WebView(
        initialUrl: '',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller=webViewController;
          _loadHtmlfromAssests();
        },
      )
    );

  }
  _loadHtmlfromAssests()async{
      String file = await rootBundle.loadString(filepath);
      _controller.loadUrl(Uri.dataFromString(file,mimeType:'democal.html',encoding: Encoding.getByName('utf-8')).toString());
  }
}
