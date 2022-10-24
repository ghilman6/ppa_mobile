// To parse this JSON data, do
//
//     final pointPpa = pointPpaFromJson(jsonString);

import 'dart:convert';

PointPpa pointPpaFromJson(String str) => PointPpa.fromJson(json.decode(str));

String pointPpaToJson(PointPpa data) => json.encode(data.toJson());

class PointPpa {
  PointPpa({
    this.idPoint,
    this.nmPoint,
    this.idPointPpaAccess,
    this.idUser,
  });

  String? idPoint;
  String? nmPoint;
  String? idPointPpaAccess;
  String? idUser;

  factory PointPpa.fromJson(Map<String, dynamic> json) => PointPpa(
        idPoint: json["id_point"],
        nmPoint: json["nm_point"],
        idPointPpaAccess: json["id_point_ppa_access"],
        idUser: json["id_user"],
      );

  List<PointPpa> jsonToList(List<dynamic> json) =>
      List<PointPpa>.from(json.map((model) => PointPpa.fromJson(model)));

  Map<String, dynamic> toJson() => {
        "id_point": idPoint,
        "nm_point": nmPoint,
        "id_point_ppa_access": idPointPpaAccess,
        "id_user": idUser,
      };
}
