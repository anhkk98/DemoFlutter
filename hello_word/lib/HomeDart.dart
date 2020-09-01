import 'dart:convert';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_word/Login/Login.dart';
import 'package:hello_word/Menu/Batdauthi.dart';
import 'package:hello_word/Menu/Bienbaogiaothong.dart';
import 'package:hello_word/Menu/GioithieuApp.dart';
import 'package:hello_word/Menu/Lienhe.dart';
import 'package:hello_word/Menu/OnthiGPLX.dart';
import 'package:hello_word/Menu/Tintuc.dart';
import 'package:hello_word/Sever/Sever.dart';
import 'package:hello_word/components/horizontal_list_view.dart';
import 'package:hello_word/phanloaixe/BottomNavigatorLoaiXe.dart';
import 'package:http/http.dart' as http;

class Hoanganh extends StatefulWidget {
  final FirebaseUser user;

  const Hoanganh({Key key, this.user}) : super(key: key);
  @override
  Hoanganhvip createState() => new Hoanganhvip();
}

class Hoanganhvip extends State<Hoanganh> {
  Future getTintuc() async {
    var url = Sever.Duongdantintuc;
    var response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _image_carousel = new Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/image/atgt.jpg'),
          AssetImage('assets/image/atgt1.jpg'),
          AssetImage('assets/image/atgt2.jpg'),
          AssetImage('assets/image/atgt3.jpg'),
        ],
        autoplay: true, // tự động lướt
        //animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0, // độ rộng  của khung đựng các chấm
        indicatorBgPadding: 3.0, // độ rộng của các chấm
      ),
    );
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'assets/image/logo3.png',
            height: 50.0,
            width: 150.0,
          ),
        ),
        actions: [
          PopupMenuButton(itemBuilder: (BuildContext context) {
            return {'Trợ giúp', 'Thoát'}.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          })
        ],
      ),
      drawer: _headerDrawer(context),
      body: ListView(
        //gọi gàm lướt hình ảnh _image_carousel
        children: <Widget>[
          _image_carousel,
          //khoảng cách giữa các widget
          new Padding(
            padding: EdgeInsets.all(5.0),
          ),
          Text(
            "Danh mục:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          // tạo danh sách ngang( horizontal list view)
          Horizontallistview(),
          new Container(
              padding: EdgeInsets.all(32.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Container(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "AVGiaoThong",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          'Tìm hiểu về giao thông',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                ],
              )),
          Divider(),
          Container(
              padding: EdgeInsets.only(left: 12.0, bottom: 5.0),
              child: Row(
                children: [
                  Expanded(child: Text("Tin tức mới nhất: ")),
                  InkWell(
                    onTap: () {
                      _pushTintuc();
                    },
                    child: Text("Xem tất cả",
                        style: TextStyle(
                            fontFamily: "Pacifico",
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline,
                            color: Colors.green)),
                  ),
                  Padding(padding: EdgeInsets.only(left: 6.0))
                ],
              )),
          Container(
              height: 200,
              child: Center(
                child: FutureBuilder(
                  future: getTintuc(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              List list = snapshot.data;
                              return GestureDetector(
                                child: Container(
                                  child: Container(
                                    width: 330.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20.0),
                                        bottomRight: Radius.circular(20.0),
                                        topLeft: Radius.circular(20.0),
                                        bottomLeft: Radius.circular(20.0),
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      children: [
                                        new Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20.0),
                                                bottomRight:
                                                Radius.circular(20.0),
                                                topLeft: Radius.circular(20.0),
                                                bottomLeft: Radius.circular(20.0),
                                              ),
                                              color: Colors.white,
                                            ),
                                            width: 145.0,
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  top: 20.0, left: 5.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Tin tức mới",
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 20.0),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            bottom: 5.0,
                                                            top: 5.0),
                                                        alignment:
                                                        Alignment.centerRight,
                                                        height: 20,
                                                        child: Text(
                                                          " Nguồn: " +
                                                              list[index]
                                                              ['nguon'],
                                                          style: TextStyle(
                                                              fontSize: 11.0,
                                                              color: Colors.blue,
                                                              decoration:
                                                              TextDecoration
                                                                  .underline),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Text(list[index]['tieude'],overflow: TextOverflow.ellipsis,maxLines: 3,),
                                                  Padding(
                                                      padding:
                                                      EdgeInsets.all(5.0)),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.add_location,
                                                        color: Colors.red,
                                                      ),
                                                      Padding(
                                                          padding:
                                                          EdgeInsets.only(
                                                              right: 20.0)),
                                                      Text(list[index]['vitri'])
                                                    ],
                                                  ),
                                                  Padding(
                                                      padding:
                                                      EdgeInsets.all(5.0)),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.access_time,
                                                        color: Colors.black,
                                                      ),
                                                      Padding(
                                                          padding:
                                                          EdgeInsets.only(
                                                              right: 5.0)),
                                                      Text(
                                                        list[index]['thoigian'],
                                                        style: TextStyle(
                                                            fontSize: 13.0),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(right: 5.0)),
                                        new Container(
                                          height: 200,
                                          width: 180.0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10.0),
                                                bottomRight:
                                                Radius.circular(10.0),
                                                topLeft: Radius.circular(10.0),
                                                bottomLeft: Radius.circular(10.0),
                                              ),
                                              color: Colors.pink[100],
                                            ),
                                            margin: EdgeInsets.only(
                                                top: 25.0,
                                                bottom: 25.0,
                                                left: 10.0,
                                                right: 10.0),
                                            child: Image.network(
                                              list[index]['anh'],
                                              alignment: Alignment.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  padding: EdgeInsets.only(right: 7.0),
                                ),
                                onTap: () => Navigator.of(context).push(
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) => new SecondScreen(
                                        list: list,
                                        index: index,
                                      )),
                                ),
                              );
                            })
                        : CircularProgressIndicator();
                  },
                ),
              ))
        ],
      ),
    );
  }

  Widget _headerDrawer(context) {
    return new Drawer(
      child: new ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Image.asset(
              'assets/image/logo.png',
              width: 170.0,
            ),
            //Text(
            // "AVGiaoThong",
            // style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),
            // ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/image/header2.jpg'),
                  fit: BoxFit.fill),
            ),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
              ),
            ),
          ),
          new ListTile(
            leading: Icon(Icons.home),
            title: Text("Trang chủ"),
            onTap: () {
              _pushHome();
            },
          ),
          new ListTile(
            leading: Icon(
              Icons.traffic,
              color: Colors.red,
            ),
            title: Text("Xử phạt giao thông"),
            onTap: () {
              _pushXpgt();
            },
          ),
          new ListTile(
            leading: Icon(
              Icons.directions,
              color: Colors.blue,
            ),
            title: Text("Biển báo giao thông"),
            onTap: () {
              _pushBbgt();
            },
          ),
          new ListTile(
            leading: Icon(
              Icons.assignment,
              color: Colors.pink,
            ),
            title: Text("Tin tức"),
            onTap: () {
              _pushTintuc();
            },
          ),
          new ListTile(
            leading: Icon(
              Icons.book,
              color: Colors.purple,
            ),
            title: Text("Ôn thi GPLX"),
            onTap: () {
              _pushOnthiGPLX();
            },
          ),
          new ListTile(
            leading: Icon(
              Icons.error_outline,
              color: Colors.green,
            ),
            title: Text("Giới thiệu App"),
            onTap: () {
              _pushThongtin();
            },
          ),
          new ListTile(
            leading: Icon(
              Icons.phone_android,
              color: Colors.black,
            ),
            title: Text("Liên hệ"),
            onTap: () {
              _pushLienhe();
            },
          ),
          new ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.red,
            ),
            title: Text("Đăng xuất"),
            onTap: () {
              _pushDangxuat();
            },
          ),
        ],
      ),
    );
  }

  void _pushHome() {
    Navigator.pop(context);
  }

  void _pushXpgt() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return BottomNavigatorLoaixe();
    }));
  }

  void _pushBbgt() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Bienbaogiaothong();
    }));
  }

  void _pushTintuc() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Tintuc();
    }));
  }

  void _pushOnthiGPLX() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Batdauthi();
    }));
  }

  void _pushThongtin() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Gioithieu();
    }));
  }

  void _pushLienhe() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Lienhe();
    }));
  }

  void _pushDangxuat() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Login();
    }));
  }
}
