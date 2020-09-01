import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hello_word/HomeDart.dart';
import 'package:hello_word/Thuvienluat/oto/Chuyenhuong.dart';
import 'package:hello_word/Thuvienluat/oto/Doxe.dart';
import 'package:hello_word/Thuvienluat/oto/Hieulenh.dart';
import 'package:hello_word/phanloaixe/BottomNavigatorLoaiXe.dart';

class Oto extends StatefulWidget {
  @override
  _OtoApp createState() => new _OtoApp();
}

class _OtoApp extends State<Oto> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){_pushHome();}),
        title: Center(
          child: Text("Xử phạt giao thông (Ô tô)"),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Image.network(
                  "https://baovephapluat.vn/data/images/0/2018/11/01/ntanh/5016-ec7f4c94fc056fe5a422f008b56a4eba.jpg?w=500",
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                padding: EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  gradient: RadialGradient(colors: [
                    Colors.grey[800],
                    Colors.yellow,
                  ], radius: 0.85, focal: Alignment.center),
                ),
                child: GridView(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    crossAxisCount: 3,
                  ),
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(60.0),
                          bottomRight: Radius.circular(60.0),
                          topLeft: Radius.circular(60.0),
                          bottomLeft: Radius.circular(60.0),
                        ),
                        color: Colors.orange,
                      ),
                      child: new ListTile(
                        onTap: (){
                          _pushHieulenh();
                        },
                        contentPadding: EdgeInsets.all(20.0),
                        title: Icon(
                          Icons.assistant_photo,
                          color: Colors.yellow,
                          size: 40.0,
                        ),
                        subtitle: Text(
                          "Hiệu lệnh, chỉ dẫn",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(60.0),
                          bottomRight: Radius.circular(60.0),
                          topLeft: Radius.circular(60.0),
                          bottomLeft: Radius.circular(60.0),
                        ),
                        color: Colors.orange,
                      ),
                      child: new ListTile(
                        contentPadding: EdgeInsets.all(20.0),
                        onTap: () {
                          _pushChuyenhuong();
                        },
                        title: Icon(
                          Icons.directions,
                          color: Colors.blue,
                          size: 40.0,
                        ),
                        subtitle: Text(
                          'Chuyển hướng làn đường',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(60.0),
                          bottomRight: Radius.circular(60.0),
                          topLeft: Radius.circular(60.0),
                          bottomLeft: Radius.circular(60.0),
                        ),
                        color: Colors.orange,
                      ),
                      child: new ListTile(
                        contentPadding: EdgeInsets.all(20.0),
                        onTap: () {
                          _pushDoxe();
                        },
                        title: Icon(
                          Icons.directions_car,
                          color: Colors.red,
                          size: 40.0,
                        ),
                        subtitle: Text(
                          'Dừng, đỗ xe',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(60.0),
                          bottomRight: Radius.circular(60.0),
                          topLeft: Radius.circular(60.0),
                          bottomLeft: Radius.circular(60.0),
                        ),
                        color: Colors.orange,
                      ),
                      child: new ListTile(
                        contentPadding: EdgeInsets.all(20.0),
                        onTap: () {},
                        title: Icon(
                          Icons.network_check,
                          color: Colors.indigo,
                          size: 40.0,
                        ),
                        subtitle: Text(
                          'Tốc độ quy định',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(60.0),
                          bottomRight: Radius.circular(60.0),
                          topLeft: Radius.circular(60.0),
                          bottomLeft: Radius.circular(60.0),
                        ),
                        color: Colors.orange,
                      ),
                      child: new ListTile(
                        contentPadding: EdgeInsets.all(20.0),
                        onTap: () {},
                        title: Icon(
                          Icons.do_not_disturb,
                          color: Colors.red,
                          size: 40.0,
                        ),
                        subtitle: Text(
                          'Đường cấm, đường 1 chiều',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(60.0),
                          bottomRight: Radius.circular(60.0),
                          topLeft: Radius.circular(60.0),
                          bottomLeft: Radius.circular(60.0),
                        ),
                        color: Colors.orange,
                      ),
                      child: new ListTile(
                        contentPadding: EdgeInsets.all(20.0),
                        onTap: () {},
                        title: Icon(
                          Icons.recent_actors,
                          color: Colors.tealAccent,
                          size: 40.0,
                        ),
                        subtitle: Text(
                          'Giấy tờ xe',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _pushHieulenh() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context){
          return Hieulenhoto();
        })
    );
  }

  void _pushChuyenhuong() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context){
          return Chuyenhuongoto();
        })
    );
  }
  void _pushDoxe() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context){
          return Doxeoto();
        })
    );
  }
  void _pushHome() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context){
          return Hoanganh();
        })
    );
  }
}
