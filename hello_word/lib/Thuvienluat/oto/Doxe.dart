import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_word/Sever/Sever.dart';
import 'package:hello_word/Thuvienluat/oto/AddUpdate/AddUpdateDoxe.dart';
import 'package:hello_word/Thuvienluat/oto/AddUpdate/AddUpdateHieulenh.dart';
import 'package:hello_word/phanloaixe/BottomNavigatorLoaiXe.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_slidable/flutter_slidable.dart';

class Doxeoto extends StatefulWidget {
  @override
  _DoxeotoState createState() => _DoxeotoState();
}

class _DoxeotoState extends State<Doxeoto> {
  List countries = [];
  List filterCountries = [];
  bool isSearching = false;
  Future getData() async {
    var url = Sever.Duongdandoxeoto;
    var response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  void initState() {
    getData().then((data) {
      setState(() {
        countries = filterCountries = data;
      });
    });
    super.initState();
  }

  void _filterCountries(value) {
    setState(() {
      filterCountries = countries
          .where((country) => country['tenloidxoto']
          .toLowerCase()
          .contains(value.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return BottomNavigatorLoaixe();
              }));
            }),
          actions: [
            isSearching
                ? IconButton(
                icon: Icon(Icons.cancel),
                onPressed: () {
                  setState(() {
                    this.isSearching = false;
                    filterCountries = countries;
                  });
                })
                : IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    this.isSearching = true;
                  });
                })
          ],
          title: !isSearching
              ? Text('Đỗ xe ô tô')
              : TextField(
            onChanged: (value) {
              _filterCountries(value);
            },
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintText: "Tìm kiếm",
                hintStyle: TextStyle(color: Colors.white)),
          )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Colors.yellow,),
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddUpdateDoxeoto(),
            ),
          );
          debugPrint('Clicked FloatingActionButton Button');
        },
      ),
      body: Center(
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ListView.builder(
                itemCount: filterCountries.length,
                itemBuilder: (context, index) {
                  List list = filterCountries;

                  return Container(
                      padding: EdgeInsets.all(5.0),
                    child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                      ), color: Colors.green[100]
                    ),
                    child: Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      secondaryActions: <Widget>[
                        IconSlideAction(
                          caption: 'Sửa',
                          color: Colors.black45,
                          icon: Icons.edit,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddUpdateDoxeoto(
                                  list: list,
                                  index: index,
                                ),
                              ),
                            );
                          },
                        ),
                        IconSlideAction(
                          caption: 'Xóa',
                          color: Colors.red,
                          icon: Icons.delete,
                          onTap: () {
                            var url =
                                Sever.Duongdandeletedoxeoto;
                            http.post(url, body: {
                              'id': list[index]['id'],
                            });
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return Doxeoto();
                                }));
                          },
                        ),
                      ],
                      key: ObjectKey(snapshot),
                      child: ListTile(
                        title: new Container(
                          padding: EdgeInsets.all(1.0),
                          margin: EdgeInsets.all(5.0),
                          child: new Row(
                            children: [
                              Image.network(
                                list[index]['anhdxoto'],
                                height: 150,
                                width: 100,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    new Container(
                                      padding: EdgeInsets.only(bottom: 8.0),
                                      child: Text(
                                        "Lỗi: " + list[index]['tenloidxoto'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      'Phạt tiền từ: ' +
                                          list[index]['phattiendxoto'],
                                      style: TextStyle(color: Colors.red),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (BuildContext context) => new SecondScreen(list: list,index: index,))
                          );
                        },
                      ),
                    ),
                    )
                  );
                })
                : CircularProgressIndicator();
          },
        ),
      )
    );
  }
}
class SecondScreen extends StatefulWidget {
  List list;
  int index;
  SecondScreen({this.index,this.list});
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết lỗi vi phạm đỗ xe ô tô'),
      ),
      body: new SingleChildScrollView(
        padding: EdgeInsets.all(7.0),
        child: IntrinsicHeight(
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),color: Colors.grey[300]
            ),
            child: Column(
              children: [
                Padding(
                  child: Text(
                    "Người điều khiển xe ô tô và các loại xe tương tự xe ô tô",
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                  padding: EdgeInsets.only(bottom: 20.0),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Image.network(
                    widget.list[widget.index]['anhdxoto'],
                    width: double.infinity,
                    height: 140.0,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new Container(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "Lỗi: " + widget.list[widget.index]['tenloidxoto'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      new Container(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'Phạt tiền từ '+ widget.list[widget.index]['phattiendxoto'],
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      new Container(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            '+ Hình thức phạt bổ sung: ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      Text('    - '+widget.list[widget.index]['noidungdxoto'])
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
