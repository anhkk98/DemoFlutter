import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Hieulenhxm_model {
  final int id;
  final String tenluat;
  final String tienphat;
  final String anh;
  final String noidungluat;


  Hieulenhxm_model({
      this.id, this.tenluat, this.tienphat, this.anh, this.noidungluat});


  factory Hieulenhxm_model.formJson(Map <String, dynamic> json){
    return new Hieulenhxm_model(
      id: json['id'],
      tenluat: json['tenluat'],
      tienphat: json['tienphat'],
      anh: json['anh'],
      noidungluat: json['noidungluat'],
    );
  }
}

class Hieulenh extends StatefulWidget {
  @override
  _HieulenhState createState() => _HieulenhState();
}

class _HieulenhState extends State<Hieulenh> {
  List<Hieulenhxm_model> _list = [];
  List<Hieulenhxm_model> _search = [];
  var loading = false;
  Future<Null> fetchData() async {
    setState(() {
      loading = true;
    });
    _list.clear();
    final response =
    await http.get("https://gist.githubusercontent.com/anhkk98/98ff4eb59d0d1a55a47a75fe154a0a25/raw/0f001c34ac9d3f18ac94c4242a01467600b7d596/hieulenh");
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          _list.add(Hieulenhxm_model.formJson(i));
          loading = false;
        }
      });
    }
  }

  TextEditingController controller = new TextEditingController();

  onSearch(String text) async {
    _search.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _list.forEach((f) {
      if (f.tenluat.contains(text) || f.id.toString().contains(text))
        _search.add(f);
    });

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(
        child: Text('Hiệu lệnh xe máy'),
      ),),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              color: Colors.blue,
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.search),
                  title: TextField(
                    controller: controller,
                    onChanged: onSearch,
                    decoration: InputDecoration(
                        hintText: "Search", border: InputBorder.none),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      controller.clear();
                      onSearch('');
                    },
                    icon: Icon(Icons.cancel),
                  ),
                ),
              ),
            ),
            loading
                ? Center(
              child: CircularProgressIndicator(),
            )
                : Expanded(
              child: _search.length != 0 || controller.text.isNotEmpty
                  ? ListView.builder(
                itemCount: _search.length,
                itemBuilder: (context, i) {
                  final b = _search[i];
                  return Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            b.tenluat,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text('Phạt tiền từ '+b.tienphat, style: TextStyle(color: Colors.red),),
                        ],
                      ));
                },
              )
                  : ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, i) {
                  final a = _list[i];
                  return Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            a.tenluat,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text('Phạt tiền từ '+a.tienphat, style: TextStyle(color: Colors.red),),
                        ],
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
