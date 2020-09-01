import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hello_word/HomeDart.dart';
import 'package:hello_word/Thuvienluat/xemay/Doxe.dart';
import 'package:hello_word/Thuvienluat/xemay/Hieulenh.dart';
import 'file:///F:/Flutter/hello_word/lib/Thuvienluat/xemay/Chuyenhuonglanduong.dart';

class Xemay extends StatefulWidget {
  @override
  _XemayApp createState() => new _XemayApp();
}

class _XemayApp extends State<Xemay> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){_pushHome();}),
        title: Center(
          child: Text("Xử phạt giao thông (Xe gắn máy)"),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Image.network(
                  "https://i.ytimg.com/vi/9VcAMXMFOOY/maxresdefault.jpg",
                  fit: BoxFit.fill,
                ),
              ),
              
              Container(
                padding: EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  gradient: RadialGradient(colors: [
                    Colors.grey[800],
                    Colors.yellowAccent,
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
                          _pushHieulenhxm();
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
                          _pushChuyenhuongxm();
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
                          _pushDoxexm();
                        },
                        title: Icon(
                          Icons.directions_bike,
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
  void _pushChuyenhuongxm() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context){
        return Chuyenhuonglanduong();
      })
    );
  }
  void _pushHieulenhxm() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context){
          return Hieulenh();
        })
    );
  }
  void _pushDoxexm() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context){
          return Doxexm();
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
