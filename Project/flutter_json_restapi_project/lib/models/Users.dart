// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<Users> usersFromJson(String str) =>
    List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  int id;
  String isim;
  String soyIsim;
  String telefonNo;
  String kullancAdi;
  String avatar;
  String sifre;

  Users({
    required this.id,
    required this.isim,
    required this.soyIsim,
    required this.telefonNo,
    required this.kullancAdi,
    required this.avatar,
    required this.sifre,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        isim: json["Isim"],
        soyIsim: json["Soy_isim"],
        telefonNo: json["TelefonNo"],
        kullancAdi: json["KullanıcıAdı"],
        avatar: json["Avatar"],
        sifre: json["Sifre"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Isim": isim,
        "Soy_isim": soyIsim,
        "TelefonNo": telefonNo,
        "KullanıcıAdı": kullancAdi,
        "Avatar": avatar,
        "Sifre": sifre,
      };
}
