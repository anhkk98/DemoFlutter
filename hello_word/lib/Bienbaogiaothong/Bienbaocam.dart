import 'package:flutter/material.dart';

class Bienbaocam extends StatefulWidget {
  @override
  _BienbaocamApp createState() => new _BienbaocamApp();
}
class _BienbaocamApp extends State<Bienbaocam> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final myImageAndCaption = [
      ["assets/image/bienbaocam1.png", "Cấm đi ngược chiều"],
      ["assets/image/bienbaocam2.png", "Cấm ..."],
      ["assets/image/bienbaocam3.png", "Cấm rẽ phải, đi thẳng"],
      ["assets/image/bienbaocam4.png", "Cấm ô tô tải"],
      ["assets/image/bienbaocam5.png", "Cấm ô tô rẽ phải"],
      ["assets/image/bienbaocam4.png", "Cấm ô tô tải"],
      ["assets/image/bienbaocam4.png", "Cấm ô tô tải"],
      ["assets/image/bienbaocam4.png", "Cấm ô tô tải"],
      ["assets/image/bienbaocam4.png", "Cấm ô tô tải"],
      ["assets/image/bienbaocam4.png", "Cấm ô tô tải"],
      ["assets/image/bienbaocam4.png", "Cấm ô tô tải"],
      ["assets/image/bienbaocam4.png", "Cấm ô tô tải"],
      ["assets/image/bienbaocam4.png", "Cấm ô tô tải"],
      ["assets/image/bienbaocam3.png", "Cấm rẽ phải, đi thẳng"],
      ["assets/image/bienbaocam3.png", "Cấm rẽ phải, đi thẳng"],
      ["assets/image/bienbaocam3.png", "Cấm rẽ phải, đi thẳng"],
      ["assets/image/bienbaocam3.png", "Cấm rẽ phải, đi thẳng"],
      ["assets/image/bienbaocam3.png", "Cấm rẽ phải, đi thẳng"],
      ["assets/image/bienbaocam3.png", "Cấm rẽ phải, đi thẳng"],

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
                    SizedBox(
                      width: 105,
                      child: Text(i.last, style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      );

  }
}