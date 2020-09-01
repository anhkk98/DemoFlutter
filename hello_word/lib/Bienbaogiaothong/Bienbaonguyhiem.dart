import 'package:flutter/material.dart';

class Bienbaonguyhiem extends StatefulWidget {
  @override
  _BienbaonguyhiemApp createState() => new _BienbaonguyhiemApp();
}
class _BienbaonguyhiemApp extends State<Bienbaonguyhiem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Biển báo nguy hiểm"),
        ),
      ),
      body: Center(
        child: Text("Biển báo nguy hiểm"),
      ),
    );
  }
}