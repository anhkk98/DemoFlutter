import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bienhieulenh extends StatefulWidget {
  @override
  _BienhieulenhApp createState() => new _BienhieulenhApp();
}
class _BienhieulenhApp extends State<Bienhieulenh> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final myImageAndCaption = [
      ["assets/image/bienchidan1.png", "Biển đi thằng"],
      ["assets/image/bienchidan2.png", "Biến chỉ dẫn đi thẳng và rẽ trái"],
      ["assets/image/bienchidan3.png", "Đi thằng, quẹo phải vòng lại"],
      ["assets/image/bienchidan4.png", "Đi thằng, giao nhau khi rẽ phải "],

    ];
    return Scaffold(
        appBar: AppBar(title: Text("Biển báo cấm"),),
        body: new Container(
          padding: EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            gradient: RadialGradient(colors: [
              Colors.yellow[200],
              Colors.lightGreenAccent,
            ], radius: 0.85, focal: Alignment.center),
          ),
          child: GridView.count(
            padding: EdgeInsets.only(top: 20),
            crossAxisCount: 3,
            children: [
              ...myImageAndCaption.map(
                    (i) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Material(
                      shape: CircleBorder(),
                      elevation: 12.0,
                      child: Image.asset(
                        i.first,
                        fit: BoxFit.fitWidth,
                        height: 90,
                        width: 90,
                      ),
                    ),

                    Expanded(flex: 1,child: SizedBox(
                      width: 105,
                      child: Text(i.last, style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                    ),),

                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}