import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Dorel extends StatefulWidget {
  @override
  _Dorel createState() => _Dorel();
}
class _Dorel extends State<Dorel> with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> dkey = GlobalKey<FormState>();
  int temp = 0;
  int d1, cm, pm;
  bool show = false;
  TextEditingController _firstController = TextEditingController();
  TextEditingController _secondController = TextEditingController();
  TextEditingController _thirdController = TextEditingController();
  double uCharge, fCharge, x;

  int fblock,sblock,tblock,fourthblock,fifthblock;

  DateTime selectedDate = DateTime.now();
  DateTime selectedDate2 = DateTime.now();


  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> _selectDate2(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate2,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate2)
      setState(() {
        selectedDate2 = picked;
      });
  }


  @override
  Widget build(BuildContext context) {
    return _domestic();
  }

  double fEnd (d1,uCharge,fCharge){

    final double result=(d1*uCharge)+fCharge;

    return result;

  }


  Widget _domestic() {
    return Form(
      key: dkey,
      child: Container(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    // padding: const EdgeInsets.only(top: 20.0, bottom: 2.0),
                    child: Text('Previous Metering Date :-',
                      style: TextStyle(fontSize: 17),),
                  ),
                  Container(

                      margin: const EdgeInsets.only(
                          top: 20.0, bottom: 2.0, left: 3.0),
                      padding: const EdgeInsets.only(left: 6.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2.0),

                      ),
                      child: Row(
                        children: [
                          Text("${selectedDate.toLocal()}".split(' ')[0]),
                          IconButton(icon: Icon(Icons.date_range),
                              onPressed: () => _selectDate(context)),
                        ],
                      )
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(

                    // padding: const EdgeInsets.only(top: 20.0, bottom: 2.0),
                    child: Text('Current Metering Date :-',
                      style: TextStyle(fontSize: 17),),
                  ),
                  Container(

                      margin: const EdgeInsets.only(
                          top: 20.0, bottom: 2.0, left: 3.0),
                      padding: const EdgeInsets.only(left: 6.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2.0),

                      ),
                      child: Row(
                        children: [
                          Text("${selectedDate2.toLocal()}".split(' ')[0]),
                          IconButton(icon: Icon(Icons.date_range),
                              onPressed: () => _selectDate2(context)),
                        ],
                      )
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 2.0),
                        child: Text('Previous Meter \n Reading',
                          style: TextStyle(fontSize: 17),),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        // decoration: BoxDecoration(
                        //   border: Border.all(color: Colors.black,width: 2.0),
                        //
                        // ),
                        width: 140.0,
                        child: TextFormField(
                          validator: (text) {
                            if (text.isEmpty) {
                              return 'This is cannot be \n empty';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (text) {
                            pm = int.parse(text);
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
                        padding: const EdgeInsets.only(top: 20.0, bottom: 2.0),
                        child: Text('Current Meter \n Reading',
                          style: TextStyle(fontSize: 17),),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        // decoration: BoxDecoration(
                        //   border: Border.all(color: Colors.black,width: 2.0),
                        //
                        // ),
                        width: 140.0,
                        child: TextFormField(

                          validator: (text) {
                            if (text.isEmpty) {
                              return 'This is cannot be \n empty';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (text) {
                            cm = int.parse(text);
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      child: Text('CALCULATE'), onPressed: () {
                    if (dkey.currentState.validate()) {
                      dkey.currentState.save();
                      calculatedomestic(pm, cm, selectedDate, selectedDate2);
                    }
                  }),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 5.0),

                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.all(10.0),
                                child: Text(
                                  'No of days', style: TextStyle(fontSize: 17),)
                            ),
                            Container(
                              margin: const EdgeInsets.all(10.0),
                              // decoration: BoxDecoration(
                              //   border: Border.all(color: Colors.black,width: 2.0),
                              //
                              // ),
                              width: 140.0,
                              child: TextFormField(
                                controller: _firstController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                readOnly: true,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.all(10.0),
                                child: Text('Number of Units',
                                  style: TextStyle(fontSize: 17),)
                            ),
                            Container(
                              margin: const EdgeInsets.all(10.0),
                              // decoration: BoxDecoration(
                              //   border: Border.all(color: Colors.black,width: 2.0),
                              //
                              // ),
                              width: 140.0,
                              child: TextField(
                                controller: _secondController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                readOnly: true,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center ,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Container(
                                  margin: const EdgeInsets.all(10.0),
                                  child: Text('Total Charge (RS.)',
                                    style: TextStyle(fontSize: 17),)
                              ),
                              Container(
                                margin: const EdgeInsets.all(10.0),
                                // decoration: BoxDecoration(
                                //   border: Border.all(color: Colors.black,width: 2.0),
                                // ),
                                width: 140.0,
                                child: AbsorbPointer(
                                  child: TextFormField(
                                    controller: _thirdController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    readOnly: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(child: Text("Describe calculations"),
                onPressed: setcal
              ),
              if(show)...[
                showcal()
              ]

            ],
          ),
        ),

      ),
    );
  }

  void calculatedomestic(pm, cm, selectedDate, selectedDate2) {
    setState(() {
      int meter = cm - pm;
      d1 = selectedDate2.difference(selectedDate).inDays;
      _secondController.text = meter.toString();
      _firstController.text = d1.toString();
      if (meter > d1 * 2) {
        if (d1 * 2 < meter && meter <= d1 * 6) {
          if (d1 * 2 < meter && meter <= d1 * 3) {
            x = fEnd(d1 * 2, 7.85, 0) + fEnd(meter - d1 * 2, 10.0, 90);
            fblock= meter - d1 * 2;
            tblock=fourthblock=sblock=0;
            _thirdController.text = x.toString();

            print(x);
          } else if (d1 * 3 < meter && meter <= d1 * 4) {
            x = fEnd(d1 * 2, 7.85, 0) + fEnd(d1, 10.0, 0) +
                fEnd(meter - d1 * 3, 27.75, 480);
            sblock= meter - d1 * 3;
            tblock=fourthblock=fblock=0;
            _thirdController.text = x.toString();
            print(x);
          } else if (d1 * 4 < meter && meter <= d1 * 6) {
            x = fEnd(d1 * 2, 7.85, 0) + fEnd(d1, 10.0, 0) + fEnd(d1, 27.75, 0) +
                fEnd(meter - d1 * 4, 32.0, 480);
            tblock= meter - d1 * 3;
            fourthblock=fourthblock=fblock=0;
            _thirdController.text = x.toString();
            print(x);
          }
        } else {
          x = fEnd(d1 * 2, 7.85, 0) + fEnd(d1, 10.0, 0) + fEnd(d1, 27.75, 0) +
              fEnd(d1 * 2, 32.0, 0) + fEnd(meter - d1 * 6, 45.0, 540);
          fourthblock= meter - d1 * 3;
          tblock=fourthblock=fblock=0;
          _thirdController.text = x.toString();
          print(x);
        }
      } else {
        if (0 <= meter && meter <= d1) {
          double x = fEnd(meter, 2.50, 30);
          _thirdController.text = x.toString();
          print(x);
        }
        else if (meter <= d1 * 2) {
          double x = fEnd(d1, 2.50, 0) + fEnd(meter - d1, 4.85, 60);
          _thirdController.text = x.toString();
          print(x);
        }
      }
    });
  }

  void setcal(){
    setState(() {
      show=true;
    });
  }

  Widget showcal(){
      return Container(
        margin:const EdgeInsets.all(10.0) ,
        child: Scrollbar(
          //                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               thickness: 8.0,
          child: SingleChildScrollView(

            scrollDirection: Axis.horizontal,
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle ,
              defaultColumnWidth: FixedColumnWidth(80.0),
              border: TableBorder.all(
                  color: Colors.black,
                  style: BorderStyle.solid,
                  width: 2),
              children: [
                TableRow(
                    children: [
                  Column(children:[Text('', style: TextStyle(fontSize: 15.0))]),
                  Column(children:[Text('Lower level', style: TextStyle(fontSize: 15.0))]),
                  Column(children:[Text('Upper level', style: TextStyle(fontSize: 15.0))]),
                  Column(children:[Text('Units in the block', style: TextStyle(fontSize: 15.0))]),
                  Column(children:[Text('Rate (LKR)', style: TextStyle(fontSize:15.0))]),
                  Column(children:[Text('Charge (LKR)', style: TextStyle(fontSize: 15.0))]),
                ]),
                TableRow( children: [
                  Column(children:[Text('1st block')]),
                  Column(children:[Text('0')]),
                  Column(children:[Text('${d1*2}')]),
                  Column(children:[Text('${d1*2}')]),
                  Column(children:[Text('7.85')]),
                  Column(children:[Text('${(d1*2)*7.85}')]),
                ]),
                TableRow( children: [
                  Column(children:[Text('2nd block')]),
                  Column(children:[Text('${(d1*2)+1}')]),
                  Column(children:[Text('${d1*3}')]),
                  Column(children:[Text('$fblock')]),
                  Column(children:[Text('10.00')]),
                  Column(children:[Text('${fblock*10.00}')]),
                ]),
                TableRow( children: [
                  Column(children:[Text('3rd block')]),
                  Column(children:[Text('${(d1*3)+1}')]),
                  Column(children:[Text('${d1*4}')]),
                  Column(children:[Text('$sblock')]),
                  Column(children:[Text('27.75')]),
                  Column(children:[Text('${sblock*27.75}')]),
                ]),
                TableRow( children: [
                  Column(children:[Text('4th block')]),
                  Column(children:[Text('${(d1*4)+1}')]),
                  Column(children:[Text('${d1*6}')]),
                  Column(children:[Text('$tblock')]),
                  Column(children:[Text('32.00')]),
                  Column(children:[Text('${tblock*32.00}')]),

                ]),
                TableRow( children: [
                  Column(children:[Text('5th block')]),
                  Column(children:[Text('${(d1*6)+1}')]),
                  Column(children:[Text('<')]),
                  Column(children:[Text('$fourthblock')]),
                  Column(children:[Text('45.00')]),
                  Column(children:[Text('${fourthblock*45.00}')]),
                ]),

              ],
            ),
          ),
        ),
      );
  }


}