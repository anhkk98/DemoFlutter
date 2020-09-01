import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hello_word/Login/constants.dart';
import 'package:hello_word/Sever/Sever.dart';
import 'package:hello_word/Thuvienluat/oto/Chuyenhuong.dart';
import 'package:hello_word/Thuvienluat/oto/Doxe.dart';
import 'package:hello_word/Thuvienluat/oto/Hieulenh.dart';
import 'package:hello_word/phanloaixe/BottomNavigatorLoaiXe.dart';
import 'package:http/http.dart' as http;

class AddUpdateChuyenhuongoto extends StatefulWidget {
  final List list;
  final int index;
  AddUpdateChuyenhuongoto({this.list, this.index});
  @override
  _AddUpdateChuyenhuongotoState createState() => _AddUpdateChuyenhuongotoState();
}

class _AddUpdateChuyenhuongotoState extends State<AddUpdateChuyenhuongoto> {
  TextEditingController tenloichoto = TextEditingController();
  TextEditingController phattienchoto = TextEditingController();
  TextEditingController noidungchoto = TextEditingController();
  TextEditingController anhchoto = TextEditingController();

  bool editMode = false;
  Future<List> addUpdateData() async {
    if (editMode) {
      final response1 = await http.post(
          Sever.Duongdanupdatechuyenhuongoto,
          body: {
            'id': widget.list[widget.index]['id'],
            "tenloichoto": tenloichoto.text,
            "phattienchoto": phattienchoto.text,
            "noidungchoto": noidungchoto.text,
            "anhchoto": anhchoto.text,
          });
      var database = jsonDecode(response1.body);
      if (database == "error") {
        Fluttertoast.showToast(
            msg: "Vui lòng điền đầy đủ thông tin",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Thêm lỗi vi chuyển hướng lần đường thành công",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return Chuyenhuongoto();
        }));
      }
    } else {
      final response2 = await http.post(
          Sever.Duongdanaddchuyenhuongoto,
          body: {
            "tenloichoto": tenloichoto.text,
            "phattienchoto": phattienchoto.text,
            "noidungchoto": noidungchoto.text,
            "anhchoto": anhchoto.text,
          });
      var database = jsonDecode(response2.body);
      if (database == "error") {
        Fluttertoast.showToast(
            msg: "Vui lòng điền đầy đủ thông tin",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Thêm lỗi vi chuyển hướng lần đường thành công",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return Chuyenhuongoto();
        }));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      editMode = true;
      tenloichoto.text = widget.list[widget.index]['tenloichoto'];
      phattienchoto.text = widget.list[widget.index]['phattienchoto'];
      noidungchoto.text = widget.list[widget.index]['noidungchoto'];
      anhchoto.text = widget.list[widget.index]['anhchoto'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(editMode ? 'Cập nhật lỗi vi phạm' : 'Thêm lỗi vi phạm'),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 40.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        editMode
                            ? 'Sửa lỗi vi phạm chuyển hướng lần đường'
                            : 'Thêm lỗi vi phạm chuyển hướng lần đường',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      _buildTenloi(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _buildPhattien(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _buildNoidung(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _buildAnh(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buildXacnhanBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTenloi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Tên lỗi:',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: tenloichoto,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.border_color,
                color: Colors.white,
              ),
              hintText: 'Nhập tên lỗi',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhattien() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Mức phạt tiền:',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: phattienchoto,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.attach_money,
                color: Colors.white,
              ),
              hintText: 'Nhập mức phạt',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNoidung() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Mức phạt tiền:',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: noidungchoto,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.assignment,
                color: Colors.white,
              ),
              hintText: 'Nhập mức phạt',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAnh() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Địa chỉ ảnh:',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: anhchoto,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.image,
                color: Colors.white,
              ),
              hintText: 'Nhập địa chỉ ảnh (http)',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildXacnhanBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          addUpdateData();
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          editMode ? 'CẬP NHẬT' : 'XÁC NHẬN',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
}
