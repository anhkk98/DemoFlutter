import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_word/HomeDart.dart';
import 'package:hello_word/Sever/Sever.dart';
import 'package:http/http.dart' as http;

class Tintuc extends StatefulWidget {
  @override
  _TintucState createState() => _TintucState();
}

class _TintucState extends State<Tintuc> {
  Future getTintuc() async {
    var url = Sever.Duongdantintucout1;
    var response = await http.get(url);
    return json.decode(response.body);
  }

  Future getTintucmoinhat() async {
    var url = Sever.Duongdantintucmoinhat;
    var response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return Hoanganh();
                }));
              }),
          title: Center(
            child: Text("Tin tức giao thông"),
          ),
        ),
        body: Container(
            padding: EdgeInsets.zero,
            color: Colors.grey[200],
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.zero,
                  height: 220.0,
                  child: Center(
                    child: FutureBuilder(
                        future: getTintucmoinhat(),
                        builder: (context, snaphost) {
                          if (snaphost.hasError) print(snaphost.error);
                          return snaphost.hasData
                              ? ListView.builder(
                                  itemCount: snaphost.data.length,
                                  itemBuilder: (context, index) {
                                    List list = snaphost.data;
                                    return GestureDetector(
                                      child: Container(
                                          width: double.infinity,
                                          height: 220.0,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      list[index]['anh']),
                                                  fit: BoxFit.fill)),
                                          child: Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Container(
                                                height: 130.0,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right:
                                                                        10.0)),
                                                        Icon(
                                                          Icons.add_location,
                                                          color: Colors.red,
                                                        ),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right:
                                                                        10.0)),
                                                        Text(
                                                          list[index]['vitri'],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 3.0)),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right:
                                                                        10.0)),
                                                        Icon(
                                                          Icons.access_time,
                                                          color: Colors
                                                              .yellowAccent,
                                                        ),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right:
                                                                        10.0)),
                                                        Text(
                                                          list[index]
                                                              ['thoigian'],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      padding: EdgeInsets.only(
                                                          left: 10.0, top: 8.0),
                                                      child: InkWell(
                                                        child: Text(
                                                          list[index]['tieude'],
                                                          style: TextStyle(
                                                            fontSize: 22.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 2,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ))),
                                      onTap: () => Navigator.of(context).push(
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                new SecondScreen(
                                                  list: list,
                                                  index: index,
                                                )),
                                      ),
                                    );
                                  })
                              : CircularProgressIndicator();
                        }),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10.0)),
                Expanded(
                  child: Center(
                    child: FutureBuilder(
                      future: getTintuc(),
                      builder: (context, snaphost) {
                        if (snaphost.hasError) print(snaphost.error);
                        return snaphost.hasData
                            ? ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: snaphost.data.length,
                                itemBuilder: (context, index) {
                                  List list = snaphost.data;
                                  return GestureDetector(
                                    child: Container(
                                      child: new Container(
                                        color: Colors.white,
                                        height: 100.0,
                                        child: Row(
                                          children: [
                                            Image.network(
                                              list[index]['anh'],
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.fill,
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    right: 10.0)),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Container(
                                                    height: 55.0,
                                                    child: Text(
                                                      list[index]['tieude'],
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 3,
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 10.0)),
                                                  Container(
                                                    height: 25.0,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                            child: Row(
                                                          children: [
                                                            Icon(Icons
                                                                .add_location),
                                                            Text(
                                                              list[index]
                                                                  ['vitri'],
                                                              style: TextStyle(
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline),
                                                            )
                                                          ],
                                                        )),
                                                        Text(
                                                          list[index]
                                                              ['thoigian'],
                                                          style: TextStyle(
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                              color:
                                                                  Colors.red),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 6.0))
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      padding: EdgeInsets.only(bottom: 7.0),
                                    ),
                                    onTap: () => Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              new SecondScreen(
                                                list: list,
                                                index: index,
                                              )),
                                    ),
                                  );
                                },
                              )
                            : CircularProgressIndicator();
                      },
                    ),
                  ),
                )
              ],
            )));
  }
}

class SecondScreen extends StatefulWidget {
  List list;
  int index;
  SecondScreen({this.index, this.list});
  @override
  State<StatefulWidget> createState() {
    return _SecondScreenState();
  }
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: Text('Tin tức giao thông'),
            automaticallyImplyLeading: true,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(10.0),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Padding(
                    child: Text(
                      widget.list[widget.index]['tieude'],
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                    padding: EdgeInsets.only(bottom: 20.0),
                  ),
                  Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Image.network(
                      widget.list[widget.index]['anh'],
                      width: double.infinity,
                      height: 140.0,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Container(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Nguồn: ' + widget.list[widget.index]['nguon'],
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        ),
                        new Row(
                          children: [
                            Text(
                              widget.list[widget.index]['thoigian'],
                              style: TextStyle(
                                  color: Colors.red,
                                  fontStyle: FontStyle.italic),
                            ),
                            Text(" / ",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontStyle: FontStyle.italic)),
                            Text(widget.list[widget.index]['vitri'],
                                style: TextStyle(
                                    color: Colors.red,
                                    fontStyle: FontStyle.italic))
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text("    " + widget.list[widget.index]['noidung'])
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  _pushTintuc() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Tintuc();
    }));
  }
}
