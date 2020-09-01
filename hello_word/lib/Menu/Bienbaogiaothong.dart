import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_word/Bienbaogiaothong/Bienbaocam.dart';
import 'package:hello_word/Bienbaogiaothong/Bienbaonguyhiem.dart';
import 'package:hello_word/Bienbaogiaothong/Bienchidan.dart';
import 'package:hello_word/Bienbaogiaothong/Bienhieulenh.dart';
import 'file:///F:/Flutter/hello_word/lib/Thuvienluat/xemay/Chuyenhuonglanduong.dart';

class Bienbaogiaothong extends StatefulWidget {
  @override
  _BienbaogiaothongApp createState() => new _BienbaogiaothongApp();
}

class _BienbaogiaothongApp extends State<Bienbaogiaothong> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Biển báo giao thông'),
        ),
      ),
      body: new ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          InkWell(
            onTap: () {
              _pushBienbaocam();
            },
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                  color: Colors.red,
                ),
                width: double.infinity,
                height: 140.0,
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.all(15.0)),
                    Align(
                      alignment: Alignment.center,
                    ),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.do_not_disturb,
                        size: 80.0,
                        color: Colors.red,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 40.0)),
                    Text(
                      "Biển báo cấm",
                      style: GoogleFonts.mcLaren(
                          fontWeight: FontWeight.bold, fontSize: 22.0),
                    ),
                  ],
                )),
          ),
          Padding(padding: EdgeInsets.all(8.0)),
          InkWell(
            onTap: () {
              _pushBienhieulenh();
            },
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                  color: Colors.yellow,
                ),
                width: double.infinity,
                height: 140.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [


                    Text(
                      "Biển hiệu lệnh",
                      style: GoogleFonts.mcLaren(
                          fontWeight: FontWeight.bold, fontSize: 22.0),
                    ),
                    Padding(padding: EdgeInsets.only(right: 30.0)),

                    Align(
                      alignment: Alignment.center,
                    ),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.directions,
                        size: 80.0,
                        color: Colors.white,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 35.0)),

                  ],
                )),
          ),
          Padding(padding: EdgeInsets.all(8.0)),
          InkWell(
            onTap: () {
              _pushBienchidan();
            },
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                  color: Colors.black,
                ),
                width: double.infinity,
                height: 140.0,
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.all(15.0)),
                    Align(
                      alignment: Alignment.center,
                    ),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.transfer_within_a_station,
                        size: 80.0,
                        color: Colors.red,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 40.0)),
                    Text(
                      "Biển chỉ dẫn",
                      style: GoogleFonts.mcLaren(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                          color: Colors.white),
                    )
                  ],
                )),
          ),
          Padding(padding: EdgeInsets.all(8.0)),
          InkWell(
            onTap: () {
              _pushBienbaonguyhiem();
            },
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                  color: Colors.blue,
                ),
                width: double.infinity,
                height: 140.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [


                    Text(
                      "Biển báo nguy hiểm",
                      style: GoogleFonts.mcLaren(
                          fontWeight: FontWeight.bold, fontSize: 22.0),
                    ),
                    Padding(padding: EdgeInsets.only(right: 15.0)),

                    Align(
                      alignment: Alignment.center,
                    ),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.clear,
                        size: 80.0,
                        color: Colors.red,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 35.0)),

                  ],
                )),
          ),
          Padding(padding: EdgeInsets.all(8.0)),
        ],
      ),
    );
  }

  void _pushBienbaocam() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Bienbaocam();
    }));
  }

  void _pushBienhieulenh() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Bienhieulenh();
    }));
  }

  void _pushBienchidan() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Bienchidan();
    }));
  }

  void _pushBienbaonguyhiem() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Bienbaonguyhiem();
    }));
  }
}
