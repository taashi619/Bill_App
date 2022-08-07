import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bill_app/Widgets/domestric.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
        title: Center(
            child:Text('Bill Calculater',
                textAlign:TextAlign.center)),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage('assets/light.png'),
            ),
            ElevatedButton(child: Text('LIGHT'),onPressed: (){
              Navigator.of(context).pushNamed("/light");
            },),
            Image(
              image: AssetImage('assets/light.png'),
            ),
            ElevatedButton(child: Text('WATER'),onPressed: (){
              Navigator.of(context).pushNamed("/water");
            },)
          ],

        ),

      )
    );
  }
}



