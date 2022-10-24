// To parse this JSON data, do
//
//     final ritaseLmb = ritaseLmbFromJson(jsonString);

import 'dart:convert';

RitaseLmb ritaseLmbFromJson(String str) => RitaseLmb.fromJson(json.decode(str));

String ritaseLmbToJson(RitaseLmb data) => json.encode(data.toJson());

class RitaseLmb {
  RitaseLmb({
    this.idLmb,
    this.active,
    this.currentRitase,
    this.currentArah,
    this.statusLmb,
    this.nextRitase,
    this.nextArah,
  });

  String? idLmb;
  String? active;
  String? currentRitase;
  String? currentArah;
  String? statusLmb;
  int? nextRitase;
  int? nextArah;

  factory RitaseLmb.fromJson(Map<String, dynamic> json) => RitaseLmb(
    idLmb: json["id_lmb"],
    active: json["active"],
    currentRitase: json["current_ritase"],
    currentArah: json["current_arah"],
    statusLmb: json["status_lmb"],
    nextRitase: json["next_ritase"],
    nextArah: json["next_arah"],
  );

  Map<String, dynamic> toJson() => {
    "id_lmb": idLmb,
    "active": active,
    "current_ritase": currentRitase,
    "current_arah": currentArah,
    "status_lmb": statusLmb,
    "next_ritase": nextRitase,
    "next_arah": nextArah,
  };
}
