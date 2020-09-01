// To parse this JSON data, do
//
//     final chuyenhuongxm = chuyenhuongxmFromJson(jsonString);

import 'dart:convert';

List<Chuyenhuongxm> chuyenhuongxmFromJson(String str) => List<Chuyenhuongxm>.from(json.decode(str).map((x) => Chuyenhuongxm.fromJson(x)));

String chuyenhuongxmToJson(List<Chuyenhuongxm> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Chuyenhuongxm {
  Chuyenhuongxm({
    this.id,
    this.tenluat,
    this.tienphat,
    this.anh,
    this.noidungluat,
  });

  int id;
  String tenluat;
  String tienphat;
  String anh;
  List<String> noidungluat;

  factory Chuyenhuongxm.fromJson(Map<String, dynamic> json) => Chuyenhuongxm(
    id: json["id"],
    tenluat: json["tenluat"],
    tienphat: json["tienphat"],
    anh: json["anh"],
    noidungluat: List<String>.from(json["noidungluat"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tenluat": tenluat,
    "tienphat": tienphat,
    "anh": anh,
    "noidungluat": List<dynamic>.from(noidungluat.map((x) => x)),
  };
}
