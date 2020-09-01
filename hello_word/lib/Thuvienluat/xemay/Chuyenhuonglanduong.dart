import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hello_word/Model/Chuyenhuongxm.dart';

class Chuyenhuonglanduong extends StatefulWidget{
  @override
  _ChuyenhuonglanduongState createState() => _ChuyenhuonglanduongState();
}
class _ChuyenhuonglanduongState extends State<Chuyenhuonglanduong>{
  List<Chuyenhuongxm> _chuyenhuongxm;
  bool _loading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading = true;
    Chxm.getChuyenhuongxm().then((value){
      setState(() {
        _chuyenhuongxm = value;
        _loading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(_loading ? 'Đang tải dữ liệu, vui lòng chờ......':'Xử phạt giao thông (Xe máy)'),
        ),
      ),
      body: ListView.builder(
          itemCount: null == _chuyenhuongxm ? 0 : _chuyenhuongxm.length,
          itemBuilder: (context, index){
            Chuyenhuongxm chuyenhuongxm = _chuyenhuongxm[index];
            return new Column(
              children: [
                ListTile(
                  title: Text('Lỗi: '+chuyenhuongxm.tenluat, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),),
                  subtitle: Text('Tiền phạt: '+chuyenhuongxm.tienphat, style: TextStyle(color: Colors.red),),
                ),
                Divider(color: Colors.black,),

              ],
            );
          }),
    );
  }
}

class Chxm {
  static const String url = 'https://gist.githubusercontent.com/anhkk98/769dd484d8d7e81fe9107250994bdf5a/raw/7224257decca0d4718819a9f33f1f0b526043174/chuyenhuongxm';
  static Future<List<Chuyenhuongxm>> getChuyenhuongxm() async{
    try{
      final reponse = await http.get(url);
      if(reponse.statusCode == 200) {
        final List<Chuyenhuongxm> chuyenhuongxm = chuyenhuongxmFromJson(reponse.body);
        return chuyenhuongxm;
      }
    }catch(e){
      return List<Chuyenhuongxm> ();
    }
  }
}