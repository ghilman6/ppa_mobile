// To parse this JSON data, do
//
//     final ritase = ritaseFromJson(jsonString);

import 'dart:convert';

Ritase ritaseFromJson(String str) => Ritase.fromJson(json.decode(str));

String ritaseToJson(Ritase data) => json.encode(data.toJson());

class Ritase {
  Ritase({
    this.idLmbPpa,
    this.idLmb,
    this.kdArmada,
    this.kdTrayek,
    this.ritase,
    this.jmlPenumpang,
    this.arah,
  });

  String? idLmbPpa;
  String? idLmb;
  String? kdArmada;
  String? kdTrayek;
  String? ritase;
  String? jmlPenumpang;
  String? arah;

  factory Ritase.fromJson(Map<String, dynamic> json) => Ritase(
    idLmbPpa: json["id_lmb_ppa"],
    idLmb: json["id_lmb"],
    kdArmada: json["kd_armada"],
    kdTrayek: json["kd_trayek"],
    ritase: json["ritase"],
    jmlPenumpang: json["jml_penumpang"],
    arah: json["arah"],
  );

  List<Ritase> jsonToList(List<dynamic> json) =>
      List<Ritase>.from(json.map((model) => Ritase.fromJson(model)));

  Map<String, dynamic> toJson() => {
    "id_lmb_ppa": idLmbPpa,
    "id_lmb": idLmb,
    "kd_armada": kdArmada,
    "kd_trayek": kdTrayek,
    "ritase": ritase,
    "jml_penumpang": jmlPenumpang,
    "arah": arah,
  };
}
