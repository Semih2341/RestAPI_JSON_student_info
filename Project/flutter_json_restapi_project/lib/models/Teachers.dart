// To parse this JSON data, do
//
//     final teachers = teachersFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<Teachers> teachersFromJson(String str) =>
    List<Teachers>.from(json.decode(str).map((x) => Teachers.fromJson(x)));

String teachersToJson(List<Teachers> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Teachers {
  int id;
  int teacherId;
  String isim;
  String soyIsim;
  String password;

  Teachers({
    required this.id,
    required this.teacherId,
    required this.isim,
    required this.soyIsim,
    required this.password,
  });

  factory Teachers.fromJson(Map<String, dynamic> json) => Teachers(
        id: json["id"],
        teacherId: json["teacher_id"],
        isim: json["Isim"],
        soyIsim: json["Soy_isim"],
        password: json["Password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "teacher_id": teacherId,
        "Isim": isim,
        "Soy_isim": soyIsim,
        "Password": password,
      };
}
