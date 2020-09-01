import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hello_word/Menu/Bienbaogiaothong.dart';
import 'package:hello_word/Menu/GioithieuApp.dart';
import 'package:hello_word/Menu/Lienhe.dart';
import 'package:hello_word/Menu/OnthiGPLX.dart';
import 'package:hello_word/Menu/TinhNDC.dart';
import 'package:hello_word/Menu/Tintuc.dart';
import 'package:hello_word/phanloaixe/BottomNavigatorLoaiXe.dart';

class Horizontallistview extends StatefulWidget{
  @override
  _HorizontallistviewState createState() => _HorizontallistviewState();
}
class _HorizontallistviewState extends State<Horizontallistview> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 90.0,
      child: ListView(
        scrollDirection: Axis.horizontal, // cuộn theo chiều ngang
        children: [
          InkWell(
            onTap: () {
              _pushXpgt();
            },
            child: Category(
              image_location: 'assets/image/xpgt.png',
              image_caption: "Xử phạt GT",
            ),
          ),
          InkWell(
            onTap: () {
              _pushBbgt();
            },
            child: Category(
              image_location: 'assets/image/btgt.png',
              image_caption: "Biển báo GT",
            ),
          ),
          InkWell(
            onTap: () {
              _pushTinhndc();
            },
            child: Category(
              image_location: 'assets/image/tndc.png',
              image_caption: "Tính NĐC",
            ),
          ),
          InkWell(
            onTap: () {
              _pushOnthi();
            },
            child: Category(
              image_location: 'assets/image/gplx.png',
              image_caption: "Ôn thi GPLX",
            ),
          ),
          InkWell(
            onTap: () {
              _pushTintuc();
            },
            child: Category(
              image_location: 'assets/image/tintuc.png',
              image_caption: "Tin tức GT",
            ),
          ),
          InkWell(
            onTap: () {
              _pushThongtin();
            },
            child: Category(
              image_location: 'assets/image/gioithieu.png',
              image_caption: "Giới thiệu",
            ),
          ),
          InkWell(
            onTap: () {
              _pushLienhe();
            },
            child: Category(
              image_location: 'assets/image/lienhe.png',
              image_caption: "Liên hệ",
            ),
          ),
        ],
      ),
    );
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
  void _pushOnthi() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return OnthiGPLX();
    }));
  }

  void _pushTintuc() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Tintuc();
    }));
  }

  void _pushTinhndc() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return TinhNDC();
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
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({this.image_location, this.image_caption});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              image_location,
              width: 100.0,
              height: 60.0,
            ),
            subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  image_caption,
                  style: TextStyle(fontSize: 12.0),
                )),
          ),
        ),
      ),
    );
  }
}

