import 'package:flutter/material.dart';

class Gioithieu extends StatefulWidget {
  @override
  _GioithieuApp createState() => new _GioithieuApp();
}
class _GioithieuApp extends State<Gioithieu> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Giới thiệu Ứng dụng"),
        ),
      ),
      body: Text("Introduction"),
    );
  }
}