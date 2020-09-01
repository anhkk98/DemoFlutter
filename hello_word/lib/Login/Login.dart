import 'package:hello_word/HomeDart.dart';

import 'package:flutter/material.dart';
import 'package:hello_word/Login/Registration.dart';
import 'package:hello_word/Sever/Sever.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'FadeAnimation.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Login extends StatefulWidget{
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>{

  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();

  String mgs ='';

  Future<List> _login() async {
    final reponse = await http.post(Sever.Duongdanlogin, body: {
      "username": username.text,
      "password": password.text,
    });

    var datauser = json.decode(reponse.body);

    if (datauser.length == 0) {
      setState(() {
        mgs = "Tài khoản hoặc mật khẩu không đúng";
      });
    } else {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) {
            return Hoanganh();
          })
      );
    }

  }

    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 340,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/image/background.png'),
                            fit: BoxFit.fill
                        )
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 30,
                          width: 80,
                          height: 160,
                          child: FadeAnimation(1, Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/image/light-1.png')
                                )
                            ),
                          )),
                        ),
                        Positioned(
                          left: 150,
                          width: 80,
                          height: 130,
                          child: FadeAnimation(1.3, Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/image/light-2.png')
                                )
                            ),
                          )),
                        ),
                        Positioned(
                          right: 40,
                          top: 40,
                          width: 80,
                          height: 150,
                          child: FadeAnimation(1.5, Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/image/clock.png')
                                )
                            ),
                          )),
                        ),
                        Positioned(
                          child: FadeAnimation(1.6, Container(
                            margin: EdgeInsets.only(top: 50),
                            child: Center(
                              child: Text("Đăng nhập", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),),
                            ),
                          )),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        FadeAnimation(1.8, Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(3, 48, 251, .2),
                                    blurRadius: 20.0,
                                    offset: Offset(0, 10)
                                )
                              ]
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(
                                        color: Colors.grey[100]))
                                ),
                                child: TextFormField(
                                  controller: username,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Tên tài khoản",
                                      hintStyle: TextStyle(
                                          color: Colors.grey[400])
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: password,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Mật khẩu",
                                      hintStyle: TextStyle(
                                          color: Colors.grey[400])
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                        SizedBox(height: 30,),
                        FadeAnimation(2, Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(43, 148, 251, 1),
                                      Color.fromRGBO(93, 148, 251, .6),
                                    ]
                                )
                            ),
                            child: InkWell(
                              onTap: () {
                                _login();
                              },
                              child: Center(
                                child: Text("Đăng nhập", style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),),
                              ),
                            )
                        )),
                        SizedBox(height: 10,),
                        Text(mgs, style: TextStyle(
                            fontStyle: FontStyle.italic, color: Colors.red),),
                        SizedBox(height: 20,),
                        FadeAnimation(1.5, InkWell(
                          onTap: () {
                            _pushRegistration();
                          },
                          child: Text("Chưa có tài khoản?", style: TextStyle(
                              color: Color.fromRGBO(143, 148, 251, 1),
                              decoration: TextDecoration.underline),),
                        )),

                      ],
                    ),
                  )
                ],
              ),
            ),
          )
      );
    }
  void _pushRegistration() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context){
        return LoginScreen();
      })
    );
  }
}