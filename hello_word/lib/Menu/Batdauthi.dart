import 'package:flutter/material.dart';
import 'package:hello_word/Menu/OnthiGPLX.dart';

class Batdauthi extends StatefulWidget {
  @override
  _BatdauthiState createState() => _BatdauthiState();
}

class _BatdauthiState extends State<Batdauthi> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Ôn thi GPLX"),
      ),
      body: new Container(
        margin: const EdgeInsets.all(15.0),
        child: new Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            new MaterialButton(
                height: 50.0,
                color: Colors.green,
                onPressed: _pushStart,
                child: new Text("Quiz 1",
                  style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.white
                  ),)
            )
          ],
        ),
      ),
    );
  }

  void _pushStart() {
    setState(() {
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => OnthiGPLX()));
    });
  }
}