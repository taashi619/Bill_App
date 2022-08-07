import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Ge extends StatefulWidget {
  @override
  _Ge createState() => _Ge();
}
class _Ge extends State<Ge> with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> g1key=GlobalKey<FormState>();
  final GlobalKey<FormState> g2key=GlobalKey<FormState>();
  final GlobalKey<FormState> g3key=GlobalKey<FormState>();

  String code;
  String gvcode;
  int d1,cm,pm,am,mx,ng,day;

  @override
  Widget build(BuildContext context) {
    return _general();
  }
  Widget g2(){
    return Form(
      key: g2key,
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
                              g2key.currentState.save();
                              calculateg2(am,day,ng,mx);
                            }else if(code=='g3'){
                              calculateg3(am,day,ng,mx);
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

  void setcode(code){
    setState(() {
      this.code=code;
    });
  }
  double fEnd (d1,uCharge,fCharge){
    final double result=(d1*uCharge)+fCharge;
    return result;

  }
  void calculateg1(cm,pm){
    setState(() {
      int meter=cm-pm;
      if (meter<=300){
        final double result=fEnd(meter,18.30,240);
        print(result);
        //return result;
      }else if(meter>300){
        final double result=fEnd(meter,22.85,240);
        print(result);
        //return result;
      }
    });


  }
  void calculateg2(am,day,ng,mx){
    setState(() {
      double x=(am*26.60+day*21.80+ng*15.40)+3000;
      double y= mx*1100.0;
      print(x+y);

    });
  }
  void calculateg3(am,day,ng,mx){
    setState(() {
      double x=(am*25.50+day*20.70+ng*14.35)+3000;
      double y= mx*1000.0;
      print(x+y);

    });
  }


  Widget _general(){
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
              Container(
                margin: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(child: Text('G1'), onPressed:() => setcode('g1')),
                    ElevatedButton(child: Text('G2'), onPressed:() => setcode('g2')),
                    ElevatedButton(child: Text('G3'), onPressed:() => setcode('g3')),
                  ],
                ),
              ),
              Padding(
                  padding: new EdgeInsets.only(top: 32.0,left: 10.0,bottom: 5.0,right: 10.0),
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
                                    if(code=='g1')...[
                                      general()
                                    ]else if(code=='g2')...[
                                      g2()
                                    ]else if(code=='g3')...[
                                      g2()
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
            // ]else if(temp==6)...[
            //   Container(
            //       margin: const EdgeInsets.all(20.0),
            //       child: Text('INDUSTRY',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
            //
            //   ),
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       ElevatedButton(child: Text('L1'), onPressed:() => setcode('g1')),
            //       ElevatedButton(child: Text('L2'), onPressed:() => setcode('g2')),
            //       ElevatedButton(child: Text('L3'), onPressed:() => setcode('g3')),              ],
            //   ),
            //   Padding(
            //       padding: new EdgeInsets.only(top: 32.0,left: 10.0,bottom: 5.0),
            //       child:Center(
            //         child: Column(
            //           children: [
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //               children: [
            //                 Column(
            //                   children: [
            //                     Row(
            //                       children: [
            //                         if(code=='g1')...[
            //                           general()
            //                         ]else if(code=='g2')...[
            //                           g2()
            //                         ]else if(code=='g3')...[
            //                           g2()
            //                         ],
            //                       ],
            //                     )
            //                   ],
            //                 )
            //
            //               ],
            //             ),
            //
            //           ],
            //         ),
            //       )
            //
            //
            //   )
            // ]
          ],
        ),
      ),
    );
  }

  Widget general(){
    return Form(
      key: g1key,
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
                            g1key.currentState.save();
                            calculateg1(cm,pm);
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