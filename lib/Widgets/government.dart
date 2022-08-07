import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

    class Government extends StatefulWidget {
  @override
  _Government createState() => _Government();
}
class _Government extends State<Government> with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> gv1key = GlobalKey<FormState>();
  final GlobalKey<FormState> gv2key = GlobalKey<FormState>();

  String code;
  String gvcode;
  int d1, cm, pm, am, mx, ng, day;

  @override
  Widget build(BuildContext context) {
    return _govern();
  }

  void setgv(gvcode) {
    setState(() {
      this.gvcode = gvcode;
    });
  }

  Widget _govern() {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                margin: const EdgeInsets.all(20.0),
                child: Text('GOVERNMENT',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    child: Text('GV1'), onPressed: () => setgv('gv1')),
                ElevatedButton(
                    child: Text('GV2'), onPressed: () => setgv('gv2')),
                ElevatedButton(
                    child: Text('GV3'), onPressed: () => setgv('gv3')),
              ],
            ),
            Padding(
                padding: new EdgeInsets.only(
                    top: 32.0, left: 10.0, bottom: 5.0),
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  if(gvcode == 'gv1')...[
                                    _gov()
                                  ] else
                                    if(gvcode == 'gv2')...[
                                      gv2()
                                    ] else
                                      if(gvcode == 'gv3')...[
                                        gv2()
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
  Widget _gov(){
    return Form(
      key: gv1key,
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
                            gv1key.currentState.save();
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


  Widget gv2() {
    return Form(
      key: gv2key,
      child: Container(
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 20.0, bottom: 2.0),
                          child: Text('Previous Meter \n Reading',
                            style: TextStyle(fontSize: 17),),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 140.0,
                          child: TextFormField(
                            onSaved: (text) {
                              //pm=int. parse(text);
                            },
                            decoration: new InputDecoration(
                              hintText: "Value", border: OutlineInputBorder(),),
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
                          padding: const EdgeInsets.only(
                              top: 20.0, bottom: 2.0),
                          child: Text('Current Meter \n Reading',
                            style: TextStyle(fontSize: 17),),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 140.0,
                          child: TextFormField(
                            onSaved: (text) {
                              //cm=int. parse(text);
                            },
                            decoration: new InputDecoration(
                              hintText: "Value", border: OutlineInputBorder(),),
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 2.0),
                      child: Text(
                        'Maximum Demand', style: TextStyle(fontSize: 17),),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      width: 140.0,
                      child: TextFormField(
                        onSaved: (text) {
                          //cm=int. parse(text);
                        },
                        decoration: new InputDecoration(
                          hintText: "Value", border: OutlineInputBorder(),),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.all(20.0),
                        child: Center(
                          child: ElevatedButton(child: Text('CALCULATE'),
                              onPressed: () {
                                gv2key.currentState.save();
                                //calculateg1(cm, pm);
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