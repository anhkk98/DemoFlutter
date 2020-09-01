import 'package:flutter/material.dart';

class Lienhe extends StatefulWidget {
  @override
  _LienheApp createState() => new _LienheApp();
}
class _LienheApp extends State<Lienhe> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Liên Hệ"),
        ),
      ),
      body: Text("Contact"),
    );
  }
}