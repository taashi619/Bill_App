import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Hotel extends StatefulWidget {
  @override
  _Hotel createState() => _Hotel();
}
class _Hotel extends State<Hotel> with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> h1key = GlobalKey<FormState>();
  final GlobalKey<FormState> h2key = GlobalKey<FormState>();

  String code;
  int d1, cm, pm, am, mx, ng, day;

  @override
  Widget build(BuildContext context) {
    return _hotel();
  }

    Widget _hotel(){
      return Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(child: Text('H1'), onPressed:() => setcode('h1')),
                        ElevatedButton(child: Text('H2'), onPressed:() => setcode('h2')),
                        ElevatedButton(child: Text('H3'), onPressed:() => setcode('h3')),              ],
                    ),
                    Padding(
                        padding: new EdgeInsets.only(top: 32.0,left: 10.0,bottom: 5.0),
                        child:Center(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          if(code=='h1')...[
                                            hotel()
                                          ]else if(code=='h2')...[
                                            h2()
                                          ]else if(code=='h3')...[
                                            h2()
                                          ],
                                        ],
                                      )
                                    ],
                                  )

                                ],
                              ),

                            ],
                          ),
                        )


                    )
                    ],
                ),
              ),
      );
    }
  void setcode(code){
    setState(() {
      this.code=code;
    });
  }
  double fEnd (d1,uCharge,fCharge){
    final double result=(d1*uCharge)+fCharge;
    return result;

  }
  Widget hotel(){
    return Form(
      key: h1key,
      child: Container(
          child:Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 20.0,bottom: 2.0),
                          child:Text('Previous Meter \n Reading',style: TextStyle(fontSize: 17),),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 140.0,
                          child: TextFormField(
                            onSaved: (text){
                              pm=int. parse(text);
                            },
                            decoration: new InputDecoration(hintText: "Value", border: OutlineInputBorder(),),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],

                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 20.0,bottom: 2.0),
                          child:Text('Current Meter \n Reading',style: TextStyle(fontSize: 17),),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 140.0,
                          child: TextFormField(
                            onSaved: (text){
                              cm=int. parse(text);
                            },
                            decoration: new InputDecoration(hintText: "Value", border: OutlineInputBorder(),),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Center(
                      child: Container(
                        margin:const EdgeInsets.all(20.0) ,
                        child: Center(
                          child: ElevatedButton(child: Text('CALCULATE'), onPressed:() {
                            h1key.currentState.save();
                            //calculateg1(cm,pm);
                            }),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }

  Widget h2(){
    return Form(
      key: h2key,
      child: Container(
          child:Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 20.0,bottom: 2.0),
                          child:Text('Number of Units \n at Peak',style: TextStyle(fontSize: 17),),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 140.0,
                          child: TextFormField(
                            validator: (text){
                              if(text.isEmpty){
                                return('This is cannot \n be empty');
                              }else{
                                return null;
                              }
                            },
                            onSaved: (text){
                              am=int. parse(text);
                            },
                            decoration: new InputDecoration(hintText: "Value", border: OutlineInputBorder(),),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],

                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 20.0,bottom: 2.0),
                          child:Text('Number of Units \n at Day',style: TextStyle(fontSize: 17),),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 140.0,
                          child: TextFormField(
                            validator: (text){
                              if(text.isEmpty){
                                return('This is cannot \n be empty');
                              }else{
                                return null;
                              }
                            },
                            onSaved: (text){
                              day=int. parse(text);
                            },
                            decoration: new InputDecoration(hintText: "Value", border: OutlineInputBorder(),),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 20.0,bottom: 2.0),
                          child:Text('Number of Units at \n Off Peak',style: TextStyle(fontSize: 17),),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 140.0,
                          child: TextFormField(
                            validator: (text){
                              if(text.isEmpty){
                                return('This is cannot \n be empty');
                              }else{
                                return null;
                              }
                            },
                            onSaved: (text){
                              ng=int. parse(text);
                            },
                            decoration: new InputDecoration(hintText: "Value",border: OutlineInputBorder(),),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],

                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 20.0,bottom: 2.0),
                          margin: const EdgeInsets.only(bottom: 20.0),
                          child:Text('Maximum Demand',style: TextStyle(fontSize: 17),),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top:0.0,left: 10.0,right: 10.0),
                          width: 140.0,
                          child: TextFormField(
                            validator: (text){
                              if(text.isEmpty){
                                return('This is cannot \n be empty');
                              }else{
                                return null;
                              }
                            },
                            onSaved: (text){
                              mx=int. parse(text);
                            },
                            decoration: new InputDecoration(hintText: "Value",border: OutlineInputBorder()),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Center(
                      child: Container(
                        margin:const EdgeInsets.all(20.0) ,
                        child: Center(
                          child: ElevatedButton(child: Text('CALCULATE'), onPressed:() {
                            if(code=='g2'){
                              h2key.currentState.save();
                              //calculateg2(am,day,ng,mx);
                            }else if(code=='g3'){
                              //calculateg3(am,day,ng,mx);
                            }

                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }
}