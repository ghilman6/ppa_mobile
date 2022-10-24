// To parse this JSON data, do
//
//     final lmb = lmbFromJson(jsonString);

import 'dart:convert';

Lmb lmbFromJson(String str) => Lmb.fromJson(json.decode(str));

String lmbToJson(Lmb data) => json.encode(data.toJson());

class Lmb {
  Lmb({
    this.idLmb,
    this.kdLmb,
    this.tglAwal,
    this.active,
    this.beban,
    this.pendapatan,
    this.margin,
    this.idDriver1,
    this.idDriver2,
    this.hj,
    this.tglAkhir,
    this.tipeLmb,
    this.targetRitase,
    this.isLate,
    this.nmTrayek,
    this.driver1,
    this.driver2,
    this.kdTrayek,
    this.idArmada,
    this.kdArmada,
    this.idTrayek,
    this.idBu,
    this.idPool,
    this.idPointAsal,
    this.idPointPpa,
  });

  String? idLmb;
  String? kdLmb;
  DateTime? tglAwal;
  String? active;
  String? beban;
  String? pendapatan;
  String? margin;
  String? idDriver1;
  String? idDriver2;
  String? hj;
  DateTime? tglAkhir;
  String? tipeLmb;
  String? targetRitase;
  dynamic isLate;
  String? nmTrayek;
  String? driver1;
  String? driver2;
  String? kdTrayek;
  String? idArmada;
  String? kdArmada;
  String? idTrayek;
  String? idBu;
  String? idPool;
  String? idPointAsal;
  String? idPointPpa;

  factory Lmb.fromJson(Map<String, dynamic> json) => Lmb(
        idLmb: json["id_lmb"],
        kdLmb: json["kd_lmb"],
        tglAwal: DateTime.parse(json["tgl_awal"]),
        active: json["active"],
        beban: json["beban"],
        pendapatan: json["pendapatan"],
        margin: json["margin"],
        idDriver1: json["id_driver1"],
        idDriver2: json["id_driver2"],
        hj: json["hj"],
        tglAkhir: DateTime.parse(json["tgl_akhir"]),
        tipeLmb: json["tipe_lmb"],
        targetRitase: json["target_ritase"],
        isLate: json["is_late"],
        nmTrayek: json["nm_trayek"],
        driver1: json["driver1"],
        driver2: json["driver2"],
        kdTrayek: json["kd_trayek"],
        idArmada: json["id_armada"],
        kdArmada: json["kd_armada"],
        idTrayek: json["id_trayek"],
        idBu: json["id_bu"],
        idPool: json["id_pool"],
        idPointAsal: json["id_point_asal"],
        idPointPpa: json["id_point_ppa"],
      );

  List<Lmb> jsonToList(List<dynamic> json) =>
      List<Lmb>.from(json.map((model) => Lmb.fromJson(model)));

  Map<String, dynamic> toJson() => {
        "id_lmb": idLmb,
        "kd_lmb": kdLmb,
        "tgl_awal":
            "${tglAwal!.year.toString().padLeft(4, '0')}-${tglAwal!.month.toString().padLeft(2, '0')}-${tglAwal!.day.toString().padLeft(2, '0')}",
        "active": active,
        "beban": beban,
        "pendapatan": pendapatan,
        "margin": margin,
        "id_driver1": idDriver1,
        "id_driver2": idDriver2,
        "hj": hj,
        "tgl_akhir":
            "${tglAkhir!.year.toString().padLeft(4, '0')}-${tglAkhir!.month.toString().padLeft(2, '0')}-${tglAkhir!.day.toString().padLeft(2, '0')}",
        "tipe_lmb": tipeLmb,
        "target_ritase": targetRitase,
        "is_late": isLate,
        "nm_trayek": nmTrayek,
        "driver1": driver1,
        "driver2": driver2,
        "kd_trayek": kdTrayek,
        "id_armada": idArmada,
        "kd_armada": kdArmada,
        "id_trayek": idTrayek,
        "id_bu": idBu,
        "id_pool": idPool,
        "id_point_asal": idPointAsal,
        "id_point_ppa": idPointPpa,
      };
}
