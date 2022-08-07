
import 'package:bill_app/Widgets/genaral.dart';
import 'package:bill_app/Widgets/hotel.dart';
import 'package:bill_app/Widgets/government.dart';
import 'package:bill_app/Widgets/industry.dart';
import 'package:bill_app/Widgets/religious.dart';
import 'package:flutter/cupertino.dart';                                                                                  
import 'package:flutter/material.dart';
import 'package:bill_app/Widgets/domestric.dart';
import 'package:bill_app/Widgets/details.dart';

class Light extends StatefulWidget {
  @override
  _Light createState() => _Light();
}


class _Light extends State<Light> with SingleTickerProviderStateMixin {
  //  final GlobalKey<FormState> d_key=GlobalKey<FormState>();
  final GlobalKey<FormState> g1key=GlobalKey<FormState>();
  final GlobalKey<FormState> g2key=GlobalKey<FormState>();

  Widget widget_ = Details();
  String name = '';

   int temp = 0;
   String code;
   String gvcode;
  int d1,cm,pm,am,mx,ng,day;
  // ignore: non_constant_identifier_names
  // TextEditingController _firstController = TextEditingController();
  // TextEditingController _secondController = TextEditingController();
  // TextEditingController _thirdController = TextEditingController();
  double uCharge,fCharge,x;


  void setvalue(x,y){
    setState(() {
      widget_ = x;
      name = y;
    });
  }
  void setgv(gvcode){
    setState(() {
      this.gvcode=gvcode;
    });
  }
  // void setcode(code){
  //   setState(() {
  //     this.code=code;
  //   });
  // }

  double fEnd (d1,uCharge,fCharge){
      final double result=(d1*uCharge)+fCharge;
      return result;

  }

  // void  calculatedomestic(pm,cm,selectedDate,selectedDate2) {
  //   setState(() {
  //     int meter=cm-pm;
  //     d1 =selectedDate2.difference(selectedDate).inDays;
  //     _secondController.text=meter.toString();
  //     _firstController.text=d1.toString();
  //     if (meter>d1*2){
  //       if(d1*2<meter && meter<=d1*6){
  //         if(d1*2<meter && meter<=d1*3){
  //           x=fEnd(d1*2,7.85,0)+fEnd(meter-d1*2,10.0,90);
  //           _thirdController.text=x.toString();
  //           print(x);
  //         }else if(d1*3<meter && meter<=d1*4){
  //           x=fEnd(d1*2,7.85,0)+fEnd(d1,10.0,0)+fEnd(meter-d1*3,27.75,480);
  //           _thirdController.text=x.toString();
  //           print(x);
  //         }else if(d1*4<meter && meter<=d1*6){
  //           x=fEnd(d1*2,7.85,0)+fEnd(d1,10.0,0)+fEnd(d1,27.75,0)+fEnd(meter-d1*4,32.0,480);
  //           _thirdController.text=x.toString();
  //           print(x);
  //         }
  //
  //       }else{
  //         x=fEnd(d1*2,7.85,0)+fEnd(d1,10.0,0)+fEnd(d1,27.75,0)+fEnd(d1*2,32.0,0)+fEnd(meter-d1*6,45.0,540);
  //         _thirdController.text=x.toString();
  //         print(x);
  //       }
  //
  //     }else{
  //       if(0<=meter && meter<=d1) {
  //         double x = fEnd(meter, 2.50, 30);
  //         _thirdController.text=x.toString();
  //         print(x);
  //       }
  //       else if(meter<=d1*2){
  //         double x=fEnd(d1,2.50,0)+fEnd(meter-d1,4.85,60);
  //         _thirdController.text=x.toString();
  //         print(x);
  //       }
  //     }
  //   });
  //
  // }
  // Widget general(){
  //   return Form(
  //     key: g1key,
  //     child: Container(
  //         child:Center(
  //           child: Column(
  //             children: [
  //               Row(
  //                 children: [
  //                   Column(
  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                     children: [
  //                       Container(
  //                         padding: const EdgeInsets.only(top: 20.0,bottom: 2.0),
  //                         child:Text('Previous Meter \n Reading',style: TextStyle(fontSize: 17),),
  //                       ),
  //                       Container(
  //                         margin: const EdgeInsets.all(10.0),
  //                         width: 140.0,
  //                         child: TextFormField(
  //                           onSaved: (text){
  //                             pm=int. parse(text);
  //                           },
  //                           decoration: new InputDecoration(hintText: "Value", border: OutlineInputBorder(),),
  //                           keyboardType: TextInputType.number,
  //                           inputFormatters: <TextInputFormatter>[
  //                             FilteringTextInputFormatter.digitsOnly
  //                           ],
  //
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 Column(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   children: [
  //                     Container(
  //                       padding: const EdgeInsets.only(top: 20.0,bottom: 2.0),
  //                       child:Text('Current Meter \n Reading',style: TextStyle(fontSize: 17),),
  //                     ),
  //                     Container(
  //                       margin: const EdgeInsets.all(10.0),
  //                       width: 140.0,
  //                       child: TextFormField(
  //                         onSaved: (text){
  //                           cm=int. parse(text);
  //                         },
  //                         decoration: new InputDecoration(hintText: "Value", border: OutlineInputBorder(),),
  //                         keyboardType: TextInputType.number,
  //                         inputFormatters: <TextInputFormatter>[
  //                           FilteringTextInputFormatter.digitsOnly
  //                         ],
  //                       ),
  //                     ),
  //                     ],
  //                   )
  //                 ],
  //               ),
  //               Row(
  //                 children: [
  //                       Center(
  //                         child: Container(
  //                           margin:const EdgeInsets.all(20.0) ,
  //                           child: Center(
  //                             child: ElevatedButton(child: Text('CALCULATE'), onPressed:() {
  //                               g1key.currentState.save();
  //                               calculateg1(cm,pm);}),
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //             ],
  //           ),
  //         )
  //     ),
  //   );
  // }
  //
  // Widget g2(){
  //   return Form(
  //     key: g2key,
  //     child: Container(
  //         child:Center(
  //           child: Column(
  //             children: [
  //               Row(
  //                 children: [
  //                   Column(
  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                     children: [
  //                       Container(
  //                         padding: const EdgeInsets.only(top: 20.0,bottom: 2.0),
  //                         child:Text('Number of Units \n at Peak',style: TextStyle(fontSize: 17),),
  //                       ),
  //                       Container(
  //                         margin: const EdgeInsets.all(10.0),
  //                         width: 140.0,
  //                         child: TextFormField(
  //                           validator: (text){
  //                             if(text.isEmpty){
  //                               return('This is cannot \n be empty');
  //                             }else{
  //                               return null;
  //                             }
  //                           },
  //                           onSaved: (text){
  //                             am=int. parse(text);
  //                           },
  //                           decoration: new InputDecoration(hintText: "Value", border: OutlineInputBorder(),),
  //                           keyboardType: TextInputType.number,
  //                           inputFormatters: <TextInputFormatter>[
  //                             FilteringTextInputFormatter.digitsOnly
  //                           ],
  //
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   Column(
  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                     children: [
  //                       Container(
  //                         padding: const EdgeInsets.only(top: 20.0,bottom: 2.0),
  //                         child:Text('Number of Units \n at Day',style: TextStyle(fontSize: 17),),
  //                       ),
  //                       Container(
  //                         margin: const EdgeInsets.all(10.0),
  //                         width: 140.0,
  //                         child: TextFormField(
  //                           validator: (text){
  //                             if(text.isEmpty){
  //                               return('This is cannot \n be empty');
  //                             }else{
  //                               return null;
  //                             }
  //                           },
  //                           onSaved: (text){
  //                             day=int. parse(text);
  //                           },
  //                           decoration: new InputDecoration(hintText: "Value", border: OutlineInputBorder(),),
  //                           keyboardType: TextInputType.number,
  //                           inputFormatters: <TextInputFormatter>[
  //                             FilteringTextInputFormatter.digitsOnly
  //                           ],
  //                         ),
  //                       ),
  //                     ],
  //                   )
  //                 ],
  //               ),
  //               Row(
  //                 children: [
  //                   Column(
  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                     children: [
  //                       Container(
  //                         padding: const EdgeInsets.only(top: 20.0,bottom: 2.0),
  //                         child:Text('Number of Units at \n Off Peak',style: TextStyle(fontSize: 17),),
  //                       ),
  //                       Container(
  //                         margin: const EdgeInsets.all(10.0),
  //                         width: 140.0,
  //                         child: TextFormField(
  //                           validator: (text){
  //                             if(text.isEmpty){
  //                               return('This is cannot \n be empty');
  //                             }else{
  //                               return null;
  //                             }
  //                           },
  //                           onSaved: (text){
  //                             ng=int. parse(text);
  //                           },
  //                           decoration: new InputDecoration(hintText: "Value",border: OutlineInputBorder(),),
  //                           keyboardType: TextInputType.number,
  //                           inputFormatters: <TextInputFormatter>[
  //                             FilteringTextInputFormatter.digitsOnly
  //                           ],
  //
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   Column(
  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                     children: [
  //                       Container(
  //                         padding: const EdgeInsets.only(top: 20.0,bottom: 2.0),
  //                         margin: const EdgeInsets.only(bottom: 20.0),
  //                         child:Text('Maximum Demand',style: TextStyle(fontSize: 17),),
  //                       ),
  //                       Container(
  //                         margin: const EdgeInsets.only(top:0.0,left: 10.0,right: 10.0),
  //                         width: 140.0,
  //                         child: TextFormField(
  //                           validator: (text){
  //                             if(text.isEmpty){
  //                               return('This is cannot \n be empty');
  //                             }else{
  //                               return null;
  //                             }
  //                           },
  //                           onSaved: (text){
  //                             mx=int. parse(text);
  //                           },
  //                           decoration: new InputDecoration(hintText: "Value",border: OutlineInputBorder()),
  //                           keyboardType: TextInputType.number,
  //                           inputFormatters: <TextInputFormatter>[
  //                             FilteringTextInputFormatter.digitsOnly
  //                           ],
  //                         ),
  //                       ),
  //                     ],
  //                   )
  //                 ],
  //               ),
  //               Row(
  //                 children: [
  //                   Center(
  //                     child: Container(
  //                       margin:const EdgeInsets.all(20.0) ,
  //                       child: Center(
  //                         child: ElevatedButton(child: Text('CALCULATE'), onPressed:() {
  //                           if(code=='g2'){
  //                           g2key.currentState.save();
  //                           calculateg2(am,day,ng,mx);
  //                         }else if(code=='g3'){
  //                             calculateg3(am,day,ng,mx);
  //                           }
  //
  //                         }),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         )
  //     ),
  //   );
  // }

  // Widget _domestic(){
  //   return Form(
  //     key: d_key,
  //     child: Container(
  //       child: Center(
  //         child: Column(
  //           children: [
  //             if(temp==1)...[
  //               new Text('DOMESTIC',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
  //             ]else if(temp==5)...[
  //               new Text('RELIGIOUS',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
  //             ],
  //             Row(
  //               children: [
  //                 Container(
  //                   padding: const EdgeInsets.only(top: 20.0,bottom: 2.0),
  //                   child:Text('Previous Metering Date :-',style: TextStyle(fontSize: 17),),
  //                 ),
  //                 Container(
  //                     margin: const EdgeInsets.only(top: 20.0,bottom: 2.0,left:3.0),
  //                     padding: const EdgeInsets.only(left:6.0),
  //                     decoration: BoxDecoration(
  //                       border: Border.all(color: Colors.black,width: 2.0),
  //
  //                     ),
  //                     child:Row(
  //                       children: [
  //                         Text("${selectedDate.toLocal()}".split(' ')[0]),
  //                         IconButton(icon: Icon(Icons.date_range), onPressed: () => _selectDate(context)),
  //                       ],
  //                     )
  //                 )
  //               ],
  //             ),
  //             Row(
  //               children: [
  //                 Container(
  //                   padding: const EdgeInsets.only(top: 20.0,bottom: 2.0),
  //                   child:Text('Current Metering Date :-',style: TextStyle(fontSize: 17),),
  //                 ),
  //                 Container(
  //                     margin: const EdgeInsets.only(top: 20.0,bottom: 2.0,left:3.0),
  //                     padding: const EdgeInsets.only(left:6.0),
  //                     decoration: BoxDecoration(
  //                       border: Border.all(color: Colors.black,width: 2.0),
  //
  //                     ),
  //                     child:Row(
  //                       children: [
  //                         Text("${selectedDate2.toLocal()}".split(' ')[0]),
  //                         IconButton(icon: Icon(Icons.date_range), onPressed: () => _selectDate2(context)),
  //
  //                       ],
  //                     )
  //                 )
  //               ],
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: [
  //                 Column(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   children: [
  //                     Container(
  //                       padding: const EdgeInsets.only(top: 20.0,bottom: 2.0),
  //                       child:Text('Previous Meter \n Reading',style: TextStyle(fontSize: 17),),
  //                     ),
  //                     Container(
  //                       margin: const EdgeInsets.all(10.0),
  //                       // decoration: BoxDecoration(
  //                       //   border: Border.all(color: Colors.black,width: 2.0),
  //                       //
  //                       // ),
  //                       width: 140.0,
  //                       child: TextFormField(
  //                         validator: (text){
  //                           if(text.isEmpty){
  //                             return 'This is cannot be \n empty';
  //                           }else{
  //                             return null;
  //                           }
  //                         },
  //                         onSaved: (text){
  //                           pm=int. parse(text);
  //                         },
  //                         decoration: new InputDecoration(hintText: "Value", border: OutlineInputBorder(),),
  //                         keyboardType: TextInputType.number,
  //                         inputFormatters: <TextInputFormatter>[
  //                           FilteringTextInputFormatter.digitsOnly
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 Column(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   children: [
  //                     Container(
  //                       padding: const EdgeInsets.only(top: 20.0,bottom: 2.0),
  //                       child:Text('Current Meter \n Reading',style: TextStyle(fontSize: 17),),
  //                     ),
  //                     Container(
  //                       margin: const EdgeInsets.all(10.0),
  //                       // decoration: BoxDecoration(
  //                       //   border: Border.all(color: Colors.black,width: 2.0),
  //                       //
  //                       // ),
  //                       width: 140.0,
  //                       child: TextFormField(
  //
  //                         validator: (text){
  //                           if(text.isEmpty){
  //                             return 'This is cannot be \n empty';
  //                           }else{
  //                             return null;
  //                           }
  //                         },
  //                         onSaved: (text){
  //                           cm=int. parse(text);
  //                         },
  //                         decoration: new InputDecoration(hintText: "Value", border: OutlineInputBorder(),),
  //                         keyboardType: TextInputType.number,
  //                         inputFormatters: <TextInputFormatter>[
  //                           FilteringTextInputFormatter.digitsOnly
  //                         ],
  //                       ),
  //                     ),
  //
  //                   ],
  //                 )
  //               ],
  //             ),
  //             Row(
  //
  //               children: [
  //                 Container(
  //                   margin:const EdgeInsets.all(20.0) ,
  //                   child: Center(
  //                       child: ElevatedButton(child: Text('CALCULATE'), onPressed:(){
  //                         if(d_key.currentState.validate()){
  //                           d_key.currentState.save();
  //                           calculatedomestic(pm,cm,selectedDate,selectedDate2);
  //                         }
  //
  //                       }),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Container(
  //               margin: const EdgeInsets.all(5.0),
  //               decoration: BoxDecoration(
  //                 border: Border.all(color: Colors.black,width: 5.0),
  //
  //               ),
  //               child: Column(
  //                 children: [
  //                   Row(
  //                     children:[
  //                       Column(
  //                         children: [
  //                           Container(
  //                               margin: const EdgeInsets.all(10.0),
  //                               child: Text('No of days',style: TextStyle(fontSize: 17),)
  //                           ),
  //                           Container(
  //                             margin: const EdgeInsets.all(10.0),
  //                             // decoration: BoxDecoration(
  //                             //   border: Border.all(color: Colors.black,width: 2.0),
  //                             //
  //                             // ),
  //                             width: 140.0,
  //                             child: TextFormField(
  //                               controller: _firstController,
  //                               decoration: InputDecoration(
  //                                 border: OutlineInputBorder(),
  //                               ),
  //                               readOnly: true,
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       Column(
  //                         children: [
  //                           Container(
  //                               margin: const EdgeInsets.all(10.0),
  //                               child: Text('Number of Units',style: TextStyle(fontSize: 17),)
  //                           ),
  //                           Container(
  //                             margin: const EdgeInsets.all(10.0),
  //                             // decoration: BoxDecoration(
  //                             //   border: Border.all(color: Colors.black,width: 2.0),
  //                             //
  //                             // ),
  //                             width: 140.0,
  //                             child: TextField(
  //                               controller: _secondController,
  //                               decoration: InputDecoration(
  //                                 border: OutlineInputBorder(),
  //                               ),
  //                               readOnly: true,
  //                             ),
  //                           ),
  //                         ],
  //                       )
  //                     ],
  //                   ),
  //                   Row(
  //                     children: [
  //                       Center(
  //                         child: Column(
  //                           children: [
  //                             Container(
  //                                 margin: const EdgeInsets.all(10.0),
  //                                 child: Text('Total Charge (RS.)',style: TextStyle(fontSize: 17),)
  //                             ),
  //                             Container(
  //                               margin: const EdgeInsets.all(10.0),
  //                               // decoration: BoxDecoration(
  //                               //   border: Border.all(color: Colors.black,width: 2.0),
  //                               // ),
  //                               width: 140.0,
  //                               child: AbsorbPointer(
  //                                 child: TextFormField(
  //                                   controller: _thirdController,
  //                                   decoration: InputDecoration(
  //                                     border: OutlineInputBorder(),
  //                                   ),
  //                                   readOnly: true,
  //                                 ),
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       )
  //                     ],
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //
  //     ),
  //   );
  // }
  // double calculateg1(cm,pm){
  //   setState(() {
  //     int meter=cm-pm;
  //     if (meter<=300){
  //      final double result=fEnd(meter,18.30,240);
  //       print(result);
  //       return result;
  //     }else if(meter>300){
  //       final double result=fEnd(meter,22.85,240);
  //       print(result);
  //       return result;
  //     }
  //   });
  //
  //
  // }
  // void calculateg2(am,day,ng,mx){
  //   setState(() {
  //     double x=(am*26.60+day*21.80+ng*15.40)+3000;
  //     double y= mx*1100.0;
  //     print(x+y);
  //
  //   });
  // }
  // void calculateg3(am,day,ng,mx){
  //   setState(() {
  //     double x=(am*25.50+day*20.70+ng*14.35)+3000;
  //     double y= mx*1000.0;
  //     print(x+y);
  //
  //   });
  // }

  // Widget _general(){
  //   return Container(
  //     child: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: [
  //           if(temp==2)...[
  //             Container(
  //                 margin: const EdgeInsets.all(20.0),
  //                 child: Text('GENARAL PERPOSE',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
  //
  //             ),
  //             Container(
  //               margin: const EdgeInsets.all(20.0),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 children: [
  //                   ElevatedButton(child: Text('G1'), onPressed:() => setcode('g1')),
  //                   ElevatedButton(child: Text('G2'), onPressed:() => setcode('g2')),
  //                   ElevatedButton(child: Text('G3'), onPressed:() => setcode('g3')),
  //                 ],
  //               ),
  //             ),
  //             Padding(
  //                 padding: new EdgeInsets.only(top: 32.0,left: 10.0,bottom: 5.0,right: 10.0),
  //                 child:Center(
  //                   child: Column(
  //                     children: [
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                         children: [
  //                           Column(
  //                             children: [
  //                               Row(
  //                                 children: [
  //                                   if(code=='g1')...[
  //                                     general()
  //                                   ]else if(code=='g2')...[
  //                                     g2()
  //                                   ]else if(code=='g3')...[
  //                                     g2()
  //                                   ],
  //                                 ],
  //                               )
  //                             ],
  //                           )
  //
  //                         ],
  //                       ),
  //
  //                     ],
  //                   ),
  //                 )
  //
  //
  //             )
  //           ]else if(temp==3)...[
  //             Container(
  //                 margin: const EdgeInsets.all(20.0),
  //                 child: Text('HOTEL',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
  //
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: [
  //                 ElevatedButton(child: Text('H1'), onPressed:() => setcode('g1')),
  //                 ElevatedButton(child: Text('H2'), onPressed:() => setcode('g2')),
  //                 ElevatedButton(child: Text('H3'), onPressed:() => setcode('g3')),              ],
  //             ),
  //             Padding(
  //                 padding: new EdgeInsets.only(top: 32.0,left: 10.0,bottom: 5.0),
  //                 child:Center(
  //                   child: Column(
  //                     children: [
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                         children: [
  //                           Column(
  //                             children: [
  //                               Row(
  //                                 children: [
  //                                   if(code=='g1')...[
  //                                     general()
  //                                   ]else if(code=='g2')...[
  //                                     g2()
  //                                   ]else if(code=='g3')...[
  //                                     g2()
  //                                   ],
  //                                 ],
  //                               )
  //                             ],
  //                           )
  //
  //                         ],
  //                       ),
  //
  //                     ],
  //                   ),
  //                 )
  //
  //
  //             )
  //           ]else if(temp==6)...[
  //               Container(
  //                   margin: const EdgeInsets.all(20.0),
  //                   child: Text('INDUSTRY',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
  //
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 children: [
  //                   ElevatedButton(child: Text('L1'), onPressed:() => setcode('g1')),
  //                   ElevatedButton(child: Text('L2'), onPressed:() => setcode('g2')),
  //                   ElevatedButton(child: Text('L3'), onPressed:() => setcode('g3')),              ],
  //               ),
  //               Padding(
  //                   padding: new EdgeInsets.only(top: 32.0,left: 10.0,bottom: 5.0),
  //                   child:Center(
  //                     child: Column(
  //                       children: [
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                           children: [
  //                             Column(
  //                               children: [
  //                                 Row(
  //                                   children: [
  //                                     if(code=='g1')...[
  //                                       general()
  //                                     ]else if(code=='g2')...[
  //                                       g2()
  //                                     ]else if(code=='g3')...[
  //                                       g2()
  //                                     ],
  //                                   ],
  //                                 )
  //                               ],
  //                             )
  //
  //                           ],
  //                         ),
  //
  //                       ],
  //                     ),
  //                   )
  //
  //
  //               )
  //             ]
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget _govern(){
  //   return Container(
  //     child: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: [
  //             Container(
  //                 margin: const EdgeInsets.all(20.0),
  //                 child: Text('GOVERNMENT',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
  //
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: [
  //                 ElevatedButton(child: Text('GV1'), onPressed:() => setgv('gv1')),
  //                 ElevatedButton(child: Text('GV2'), onPressed:() => setgv('gv2')),
  //                 ElevatedButton(child: Text('GV3'), onPressed:() => setgv('gv3')),              ],
  //             ),
  //             Padding(
  //                 padding: new EdgeInsets.only(top: 32.0,left: 10.0,bottom: 5.0),
  //                 child:Center(
  //                   child: Column(
  //                     children: [
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                         children: [
  //                           Column(
  //                             children: [
  //                               Row(
  //                                 children: [
  //                                   if(gvcode=='gv1')...[
  //                                     general()
  //                                   ]else if(gvcode=='gv2')...[
  //                                     gv2()
  //                                   ]else if(gvcode=='gv3')...[
  //                                     gv2()
  //                                   ],
  //                                 ],
  //                               )
  //                             ],
  //                           )
  //
  //                         ],
  //                       ),
  //
  //                     ],
  //                   ),
  //                 )
  //
  //
  //             )
  //         ],
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget gv2(){
  //   return Form(
  //     key: g1key,
  //     child: Container(
  //         child:Center(
  //           child: Column(
  //             children: [
  //               Row(
  //                 children: [
  //                   Column(
  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                     children: [
  //                       Container(
  //                         padding: const EdgeInsets.only(top: 20.0,bottom: 2.0),
  //                         child:Text('Previous Meter \n Reading',style: TextStyle(fontSize: 17),),
  //                       ),
  //                       Container(
  //                         margin: const EdgeInsets.all(10.0),
  //                         width: 140.0,
  //                         child: TextFormField(
  //                           onSaved: (text){
  //                             //pm=int. parse(text);
  //                           },
  //                           decoration: new InputDecoration(hintText: "Value", border: OutlineInputBorder(),),
  //                           keyboardType: TextInputType.number,
  //                           inputFormatters: <TextInputFormatter>[
  //                             FilteringTextInputFormatter.digitsOnly
  //                           ],
  //
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   Column(
  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                     children: [
  //                       Container(
  //                         padding: const EdgeInsets.only(top: 20.0,bottom: 2.0),
  //                         child:Text('Current Meter \n Reading',style: TextStyle(fontSize: 17),),
  //                       ),
  //                       Container(
  //                         margin: const EdgeInsets.all(10.0),
  //                         width: 140.0,
  //                         child: TextFormField(
  //                           onSaved: (text){
  //                             //cm=int. parse(text);
  //                           },
  //                           decoration: new InputDecoration(hintText: "Value", border: OutlineInputBorder(),),
  //                           keyboardType: TextInputType.number,
  //                           inputFormatters: <TextInputFormatter>[
  //                             FilteringTextInputFormatter.digitsOnly
  //                           ],
  //                         ),
  //                       ),
  //                     ],
  //                   )
  //                 ],
  //               ),
  //               Column(
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 children: [
  //                   Container(
  //                     padding: const EdgeInsets.only(top: 20.0,bottom: 2.0),
  //                     child:Text('Maximum Demand',style: TextStyle(fontSize: 17),),
  //                   ),
  //                   Container(
  //                     margin: const EdgeInsets.all(10.0),
  //                     width: 140.0,
  //                     child: TextFormField(
  //                       onSaved: (text){
  //                         //cm=int. parse(text);
  //                       },
  //                       decoration: new InputDecoration(hintText: "Value", border: OutlineInputBorder(),),
  //                       keyboardType: TextInputType.number,
  //                       inputFormatters: <TextInputFormatter>[
  //                         FilteringTextInputFormatter.digitsOnly
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               Row(
  //                 children: [
  //                   Center(
  //                     child: Container(
  //                       margin:const EdgeInsets.all(20.0) ,
  //                       child: Center(
  //                         child: ElevatedButton(child: Text('CALCULATE'), onPressed:() {
  //                           g1key.currentState.save();
  //                           calculateg1(cm,pm);}),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //
  //             ],
  //           ),
  //         )
  //     ),
  //   );
  // }

  // DateTime selectedDate = DateTime.now();
  // DateTime selectedDate2 = DateTime.now();
  //
  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(2015, 8),
  //       lastDate: DateTime(2101));
  //   if (picked != null && picked != selectedDate)
  //     setState(() {
  //       selectedDate = picked;
  //     });
  // }
  // Future<void> _selectDate2(BuildContext context) async {
  //   final DateTime picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate2,
  //       firstDate: DateTime(2015, 8),
  //       lastDate: DateTime(2101));
  //   if (picked != null && picked != selectedDate2)
  //     setState(() {
  //       selectedDate2 = picked;
  //     });
  // }


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        appBar: new AppBar(
          title: Center(
              child:Text('Light Bill Calculator')),
        ),

      body: Scrollbar(
        thickness: 10.0,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: new EdgeInsets.only(top: 25.0,left: 0.0 ,right: 0.0,bottom: 5.0),
                 // margin: const EdgeInsets.only(top: 30.0),
                  child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            ElevatedButton(child: Text('DOMESTIC'), onPressed:() => setvalue(Dorel(), 'DOMESTIC')),
                            ElevatedButton(child: Text('GENERAL PURPOSE'), onPressed:() => setvalue(Ge(), 'GENERAL PURPOSE')),
                            ElevatedButton(child: Text('HOTEL'), onPressed:() => setvalue(Hotel(), 'HOTEL')),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            ElevatedButton(
                                child: Text('GOVERNMENT'),
                                onPressed:() => setvalue(Government(), 'GOVERNMENT'),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                )
                            ),

                            ElevatedButton(child: Text('RELIGIOUS'), onPressed:() => setvalue(Reli(), 'RELIGIOUS')),
                            ElevatedButton(child: Text('INDUSTRY'), onPressed:() => setvalue(Industry(), 'INDUSTRY')),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text(name  ,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        widget_,

                      ],
                    ),
                  )
            ],
          ),
        ),
      ),

    );
  }


}