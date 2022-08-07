                                                                                                                                                                                                              
import 'package:bill_app/Screens/light.dart';
import 'package:bill_app/Screens/water.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screens/homepage.dart';

void main() {
  runApp(new MaterialApp(
    home: Homepage(),
    routes:<String,WidgetBuilder>{
      "/light" : (context) => Light(),
      "/water" : (context) => Water()
    } ,
  ));
}

