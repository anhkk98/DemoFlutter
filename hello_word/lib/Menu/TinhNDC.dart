import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_word/Menu/OnthiGPLX.dart';

class TinhNDC extends StatefulWidget {
  @override
  _TinhNDCState createState() => new _TinhNDCState();
}

class _TinhNDCState extends State<TinhNDC> {
  TextEditingController kilo = new TextEditingController();
  TextEditingController nongdo = new TextEditingController();
  TextEditingController thetich = new TextEditingController();

  double _volume = 0.0;
  bool checkBox = false;
  int ground = 1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Tính nồng độ cồn"),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(child: Icon(Icons.drag_handle,size: 30.0,),onPressed: () {
        _settingModalBottomSheet(context);
      }),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 60.0)),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 20.0)),
                Expanded(
                  child: new Text("Chọn giới tính: ",style: TextStyle(fontSize: 16.0)),
                ),
                Container(
                  child: Radio(value: 1, groupValue: ground, onChanged: (T) {
                    setState(() {
                      _volume = 0.7;
                      ground = T;
                    });
                  },),
                ),
                Container(
                  child: Text("Nam"),
                ),
                Container(
                  child: Radio(value: 2, groupValue: ground, onChanged: (T) {
                    setState(() {
                      _volume = 0.6;
                      ground = T;
                    });
                  },),
                ),
                Container(
                  child: Text("Nữ"),
                ),
                Padding(padding: EdgeInsets.only(right: 50.0))
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 50.0)),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 20.0)),
                Container(
                  width: 150.0,
                  child: Text("Trọng lượng cơ thể: ",style: TextStyle(fontSize: 16.0)),
                ),
                Padding(padding: EdgeInsets.only(right: 10.0)),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.red),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    color: Colors.white,
                  ),
                  width: 150.0,
                  child: TextField(
                    controller: kilo,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,

                    ),
                  ),),
                Padding(padding: EdgeInsets.all(4.0)),
                Text('(Kg)',style: TextStyle(fontSize: 16.0),)
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 20.0)),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 20.0)),
                Container(
                  width: 150.0,
                  child: Text("Nồng độ cồn: ",style: TextStyle(fontSize: 16.0)),
                ),
                Padding(padding: EdgeInsets.only(right: 10.0)),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.red),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    color: Colors.white,
                  ),
                  width: 150.0,
                  child: TextField(
                    controller: nongdo,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,

                    ),
                  ),),
                Padding(padding: EdgeInsets.all(4.0)),
                Text('(%)',style: TextStyle(fontSize: 16.0),)
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 20.0)),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 20.0)),
                Container(
                  width: 150.0,
                  child: Text("Thể tích đã uống: ",style: TextStyle(fontSize: 16.0)),
                ),
                Padding(padding: EdgeInsets.only(right: 10.0)),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.red),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    color: Colors.white,
                  ),
                  width: 150.0,
                  child: TextField(
                    controller: thetich,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,

                    ),
                  ),),
                Padding(padding: EdgeInsets.all(4.0)),
                Text('(ml)',style: TextStyle(fontSize: 16.0),),

              ],
            ),

          ],
        ),
      )
    );
  }
  Widget _tinhnongdo() {
    double nn = _volume;
    int decimals = 2;
    int fac = pow(10, decimals);
    int kio= int.parse(kilo.text);
    int kio1= int.parse(nongdo.text);
    int kio2= int.parse(thetich.text);
    double tong = (((1.056*(kio2*(kio1/100)))/(10*kio*nn))*1000);
    tong = (tong * fac).round() / fac;
    return Text(tong.toString()+"mg/100ml",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),);
  }
  Widget _tinhthoigiannghi() {
    double nn = _volume;
    int kio= int.parse(kilo.text);
    int kio1= int.parse(nongdo.text);
    int kio2= int.parse(thetich.text);
    double timenghi = (((1.056*(kio2*(kio1/100)))/(10*kio*nn)));
    double thoigian = timenghi/0.015;
    //thoigian = num.parse(thoigian.toStringAsFixed(2));
    int sss = int.parse(thoigian.toStringAsFixed(0));

    return Text(sss.toString()+" Giờ",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),);
  }


  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              color: Colors.white,
            ),
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.invert_colors),
                    title: new Text(
                      'Nồng độ còn trong máu: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),

                  trailing: _tinhnongdo()
                    ),
                new ListTile(
                  leading: new Icon(Icons.timer),
                  title: new Text('Thời gian hết cồn trong máu: ',style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18.0)),
                    trailing: _tinhthoigiannghi()
                ),
                Padding(padding: EdgeInsets.all(2.0)),
                new Center(
                  child: Text(
                    "(Giá trị chỉ mang tính chất tham khảo)",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 15.0,
                        color: Colors.red),
                  ),
                ),
                Padding(padding: EdgeInsets.all(20.0)),
              ],
            ),
          );
        });
  }
}
