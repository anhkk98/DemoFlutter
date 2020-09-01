import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hello_word/HomeDart.dart';

class CauhoiGPLX {
  var Hinhanh = [
    "cauhoi1",
    "cauhoi2",
    "cauhoi3",
    "cauhoi4",
    "cauhoi5",
    "cauhoi6",
    "cauhoi7"
  ];
  var Cauhoi = [
    "Hành vi nào dưới đây bị nghiêm cấm?",
    "Hành vi đưa xe cơ giới, xe máy chuyên dùng không đảm bảo tiêu chuẩn an toàn kỹ thuật và bảo vệ môi trường vài tham gia giao thông đường bộ có bị nghiêm cấm hay không?",
    "Cuộc đua xe chỉ có thể được thực hiện khi nào?",
    "Người điều khiển phương tiện giao thông đường bộ mà trong cơ thể có chất ma túy có bị nghiêm cấm hay không?",
    "Việc lái xe mô tô, ô tô, máy kéo ngay sau khi uống rượu, bia có được cho phép hay không?",
    "Sử dụng rượu bia khi lái xe, nếu bị phát hiện thì bị xử lý như thế nào?",
    "Khi muốn lùi xe nhưng không quan sát được phía sau, cần làm gì để đảm bảo an toàn?"
  ];
  var Cautraloi = [
    [
      "Đỗ xe trên đường phố",
      "Sử dụng xe đạp đi trên các tuyến quốc lộ có tốc độ cao.",
      "Làm hỏng (cố ý) cọc tiêu, gương cầu, dải phân cách.",
      "Sử dụng còi và quay đầu xe trong khu dân cư."
    ],
    [
      "Không nghiêm cấm.",
      "Bị nghiêm cấm.",
      "Bị nghiêm cấm tùy theo các tuyến đường.",
      "Bị nghiêm cấm tuỳ theo loại xe."
    ],
    [
      "Diễn ra trên đường phố không có người qua lại.",
      "Được người dân ủng hộ.",
      "Được cơ quan có thẩm quyền cấp phép.",
      ""
    ],
    [
      "Bị nghiêm cấm.",
      "Không bị nghiêm cấm.",
      "Không bị nghiêm cấm, nếu có chất ma tuý ở mức nhẹ, có thể điều khiển phương tiện tham gia giao thông.",
      ""
    ],
    [
      "Không được phép.",
      "Chỉ được lái ở tốc độ chậm và quãng đường ngắn.",
      "Chỉ được lái nếu trong cơ thể có nồng độ cồn thấp.",
      ""
    ],
    [
      "Chỉ bị nhắc nhở.",
      "Bị xử phạt hành chính hoặccó thể bị xử lý hình sự tùy theo mức độ vi phạm.",
      "Không bị xử lý hình sự.",
      ""
    ],
    [
      "Phải lùi thật chậm.",
      "Có thể được lùi xe nhưng phải mở cửa xe.",
      "Không được lùi xe.",
      "Bấm còi 3 lần liên tiếp trước khi lùi."
    ]
  ];
  var Dapan = [
    "Làm hỏng (cố ý) cọc tiêu, gương cầu, dải phân cách.",
    "Bị nghiêm cấm.",
    "Được cơ quan có thẩm quyền cấp phép.",
    "Bị nghiêm cấm.",
    "Không được phép.",
    "Bị xử phạt hành chính hoặccó thể bị xử lý hình sự tùy theo mức độ vi phạm.",
    "Không được lùi xe."
  ];
}

var finalScore = 0;
var questionNumber = 0;
var quiz = new CauhoiGPLX();

class OnthiGPLX extends StatefulWidget {
  @override
  _OnthiGPLXState createState() => _OnthiGPLXState();
}

class _OnthiGPLXState extends State<OnthiGPLX> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new WillPopScope(
      onWillPop: () async => false,
      child:  Scaffold(
          body: new Container(
            margin: const EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            child: new Column(
              children: [
                new Padding(padding: EdgeInsets.all(20.0)),
                new Container(
                  alignment: Alignment.centerRight,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      new Text(
                        "Câu hỏi ${questionNumber + 1} trên ${quiz.Cauhoi.length}",
                        style: TextStyle(fontSize: 22.0),
                      ),
                      new Text(
                        "Đúng: $finalScore",
                        style: TextStyle(fontSize: 22.0),
                      )
                    ],
                  ),
                ),
                new Padding(padding: EdgeInsets.all(10.0)),
                new Image.asset(
                    "assets/image/${quiz.Hinhanh[questionNumber]}.jpg",width: double.infinity,height: 150,),
                new Padding(padding: EdgeInsets.all(10.0)),
                new Text('Câu ${questionNumber +1}: '+
                  quiz.Cauhoi[questionNumber],
                  style: TextStyle(fontSize: 20.0),
                ),
                new Padding(padding: EdgeInsets.all(10.0)),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    new MaterialButton(
                      onPressed: () {
                        if (quiz.Cautraloi[questionNumber][0] ==
                            quiz.Dapan[questionNumber]) {
                          debugPrint("Chính xác");
                          finalScore++;
                        } else {
                          debugPrint('Sai');
                        }
                        capnhatCauhoi();
                      },
                      minWidth: double.infinity,

                      height: 45.0,
                      color: Colors.green,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "A.   " + quiz.Cautraloi[questionNumber][0],
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                      )
                    ),
                    new Padding(padding: EdgeInsets.only(bottom: 10.0)),
                    new MaterialButton(
                      onPressed: () {
                        if (quiz.Cautraloi[questionNumber][1] ==
                            quiz.Dapan[questionNumber]) {
                          debugPrint("Chính xác");
                          finalScore++;
                        } else {
                          debugPrint('Sai');
                        }
                        capnhatCauhoi();
                      },
                      minWidth: double.infinity,
                      height: 45.0,
                      color: Colors.green,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            "B.   " + quiz.Cautraloi[questionNumber][1],
                            style: TextStyle(color: Colors.black, fontSize: 20.0)
                        ),
                      )
                    ),
                    new Padding(padding: EdgeInsets.only(bottom: 10.0)),
                    new MaterialButton(
                      onPressed: () {
                        if (quiz.Cautraloi[questionNumber][2] ==
                            quiz.Dapan[questionNumber]) {
                          debugPrint("Chính xác");
                          finalScore++;
                        } else {
                          debugPrint('Sai');
                        }
                        capnhatCauhoi();
                      },
                        minWidth: double.infinity,
                      height: 45.0,
                      color: Colors.green,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            "C.   " + quiz.Cautraloi[questionNumber][2],
                            style: TextStyle(color: Colors.black, fontSize: 20.0)
                        ),
                      )
                    ),
                    new Padding(padding: EdgeInsets.only(bottom: 10.0)),
                    new MaterialButton(
                      onPressed: () {
                        if (quiz.Cautraloi[questionNumber][3] ==
                            quiz.Dapan[questionNumber]) {
                          debugPrint("Chính xác");
                          finalScore++;
                        } else {
                          debugPrint('Sai');
                        }
                        capnhatCauhoi();
                      },
                      minWidth: double.infinity,
                      height: 45.0,
                      color: Colors.green,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            "D.   " + quiz.Cautraloi[questionNumber][3],
                            style: TextStyle(color: Colors.black, fontSize: 20.0)
                        ),
                      )
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
    );
  }

  void capnhatCauhoi() {
    setState(() {
      if (questionNumber == quiz.Cauhoi.length - 1 ) {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new Summary(score: finalScore)));
      } else {
        questionNumber++;
      }
    });
  }
}

class Summary extends StatelessWidget {
  final int score;

  Summary({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: new Container(
            alignment: Alignment.center,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _if(),
                Padding(padding: EdgeInsets.all(20.0)),
                new Text(
                  "Số câu trả lời đúng $score/${quiz.Cauhoi.length}",
                  style: TextStyle(fontSize: 25.0),
                ),
                new Padding(padding: EdgeInsets.all(20.0)),
                new MaterialButton(
                  onPressed: () {
                    questionNumber = 0;
                    finalScore = 0;
                    Navigator.pop(context);
                  },
                  color: Colors.red,
                  child: new Text(
                      "Làm lại bài thi", style: TextStyle(fontSize: 20.0)),
                ),
                Padding(padding: EdgeInsets.all(20.0)),
                new MaterialButton(
                  onPressed: () {
                    questionNumber = 0;
                    finalScore = 0;
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context)=>new Hoanganh())
                    );
                  },
                  color: Colors.lightGreenAccent,
                  child: new Text(
                    "Trở vể trang chủ", style: TextStyle(fontSize: 20.0),),
                )
              ],
            ),
          )),
    );
  }

  Widget _if() {
    if (score == 7) {
      return Text("Tuyệt vời \n Chúc mừng bạn đã hoàn thành 100% bài thi!!! ",
        style: TextStyle(
            fontSize: 30.0, color: Colors.green, fontWeight: FontWeight.bold),);
    } else if (score == 6) {
      return Text("Xuất sắc. Chúc mừng bạn! ", style: TextStyle(
          fontSize: 30.0, color: Colors.green, fontWeight: FontWeight.bold),);
    } else if (score == 5) {
      return Text("Xuất sắc. Chúc mừng bạn! ", style: TextStyle(
          fontSize: 30.0, color: Colors.green, fontWeight: FontWeight.bold),);
    } else if (score == 4) {
      return Text("Chúc mừng bạn! ", style: TextStyle(
          fontSize: 30.0, color: Colors.green, fontWeight: FontWeight.bold),);
    } else {
      return Text("Cố gắng hơn bạn nhé! ", style: TextStyle(
          fontSize: 30.0, color: Colors.green, fontWeight: FontWeight.bold),);
    }
  }
}