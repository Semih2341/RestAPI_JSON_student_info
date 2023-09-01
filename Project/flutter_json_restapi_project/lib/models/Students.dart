// To parse this JSON data, do
//
//     final students = studentsFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<Students> studentsFromJson(String str) =>
    List<Students>.from(json.decode(str).map((x) => Students.fromJson(x)));

String studentsToJson(List<Students> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Students {
  int id;
  int studentId;
  String isim;
  String soyIsim;

  Students({
    required this.id,
    required this.studentId,
    required this.isim,
    required this.soyIsim,
  });

  factory Students.fromJson(Map<String, dynamic> json) => Students(
        id: json["id"],
        studentId: json["student_id"],
        isim: json["Isim"],
        soyIsim: json["Soy_isim"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "student_id": studentId,
        "Isim": isim,
        "Soy_isim": soyIsim,
      };
}
