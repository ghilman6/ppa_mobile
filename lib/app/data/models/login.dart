import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.nmUser,
    this.userId,
    this.username,
    this.idLevel,
    this.idBu,
    this.idPerusahaan,
    this.nmPerusahaan,
    this.active,
    this.developer,
    this.token,
  });

  String? nmUser;
  String? userId;
  String? username;
  String? idLevel;
  String? idBu;
  String? idPerusahaan;
  String? nmPerusahaan;
  String? active;
  String? developer;
  String? token;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        nmUser: json["nm_user"],
        userId: json["user_id"],
        username: json["username"],
        idLevel: json["id_level"],
        idBu: json["id_bu"],
        idPerusahaan: json["id_perusahaan"],
        nmPerusahaan: json["nm_perusahaan"],
        active: json["active"],
        developer: json["developer"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "nm_user": nmUser,
        "user_id": userId,
        "username": username,
        "id_level": idLevel,
        "id_bu": idBu,
        "id_perusahaan": idPerusahaan,
        "nm_perusahaan": nmPerusahaan,
        "active": active,
        "developer": developer,
        "token": token,
      };
}
