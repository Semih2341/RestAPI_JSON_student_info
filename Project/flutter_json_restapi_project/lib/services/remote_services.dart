// ignore_for_file: body_might_complete_normally_nullable, avoid_print

import 'dart:convert';

import 'package:flutter_json_restapi_project/getDatas/getDatas.dart';
import 'package:flutter_json_restapi_project/models/Users.dart';
import 'package:flutter_json_restapi_project/models/post.dart';
import 'package:flutter_json_restapi_project/models/Teachers.dart';
import 'package:flutter_json_restapi_project/models/Students.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }
}

//Teacher Kısmı

class RemoteTeacherService {
  Future<List<Teachers>?> getTeacher() async {
    var client = http.Client();

    var uri = Uri.parse('http://localhost:3000/teachers');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return teachersFromJson(json);
    }
  }
}

class RemoteAddTeacherService {
  Future<Students?> addStudent(
      String isim, String soyIsim, String teacherId) async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:3000/teacher');

    var requestBody = jsonEncode(
        {"Isim": isim, "Soy_isim": soyIsim, "teacher_id": teacherId});

    var responseAdd = await client.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: requestBody,
    );

    if (responseAdd.statusCode == 201) {
      var json = responseAdd.body;
      print('oldu');
      return Students.fromJson(jsonDecode(json));
    } else {
      throw Exception('Failed to add student');
    }
  }
}

class RemoteDeleteTeacherService {
  Future<void> deleteStudent(int teacherId) async {
    var client = http.Client();
    var uri = Uri.parse(
        'http://localhost:3000/student/$teacherId'); // Öğrenciye ait ID'yi içeren URL

    var responseDelete = await client.delete(uri);

    if (responseDelete.statusCode == 200) {
      print("Student with ID $teacherId deleted successfully");
    } else {
      print("Failed to delete student with ID $teacherId");
    }
  }
}

class RemoteUpdateTeacherService {
  Future<void> updateStudentField(
      int teacherId, String fieldName, String newValue) async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:3000/student/$teacherId');

    var requestBody = jsonEncode({
      fieldName: newValue,
    });

    var responseUpdate = await client.patch(
      uri,
      headers: {"Content-Type": "application/json"},
      body: requestBody,
    );

    if (responseUpdate.statusCode == 200) {
      print("Student with ID $teacherId updated successfully");
    } else {
      print("Failed to update student with ID $teacherId");
    }
  }
}

//Student Part

class RemoteStudentService {
  Future<List<Students>?> getStudent() async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:3000/student');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return studentsFromJson(json);
    }
  }
}

class RemoteAddStudentService {
  Future<Students?> addStudent(
      String isim, String soyIsim, String studentId) async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:3000/student');

    var requestBody = jsonEncode(
        {"Isim": isim, "Soy_isim": soyIsim, "student_id": studentId});

    var responseAdd = await client.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: requestBody,
    );

    if (responseAdd.statusCode == 201) {
      var json = responseAdd.body;
      print('oldu');
      return Students.fromJson(jsonDecode(json));
    } else {
      throw Exception('Failed to add student');
    }
  }
}

class RemoteDeleteStudentService {
  Future<void> deleteStudent(int studentId) async {
    var client = http.Client();
    var uri = Uri.parse(
        'http://localhost:3000/student/$studentId'); // Öğrenciye ait ID'yi içeren URL

    var responseDelete = await client.delete(uri);

    if (responseDelete.statusCode == 200) {
      print("Student with ID $studentId deleted successfully");
    } else {
      print("Failed to delete student with ID $studentId");
    }
  }
}

class RemoteUpdateStudentService {
  Future<void> updateStudentField(
      int studentId, String fieldName, String newValue) async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:3000/student/$studentId');

    var requestBody = jsonEncode({
      fieldName: newValue,
    });

    var responseUpdate = await client.patch(
      uri,
      headers: {"Content-Type": "application/json"},
      body: requestBody,
    );

    if (responseUpdate.statusCode == 200) {
      print("Student with ID $studentId updated successfully");
    } else {
      print("Failed to update student with ID $studentId");
    }
  }
}

//USER
class RemoteUserService {
  Future<List<Users>?> getUser() async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:3000/user');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return usersFromJson(json);
    }
  }
}

class RemoteAddUserService {
  Future<Users> addUser(String isim, String soyIsim, String telefonNo,
      String kullaniciAdi, String sifre, String avatar) async {
    var client = http.Client();
    var uri = Uri.parse('https://localhost:7106/api/HotelBooking/GetAll');

    var requestBody = jsonEncode({
      "Isim": isim,
      "Soy_isim": soyIsim,
      "TelefonNo": telefonNo,
      "KullanıcıAdı": kullaniciAdi,
      "Sifre": sifre,
      "Avatar": avatar
    });

    var responseAdd = await client.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: requestBody,
    );
    print(responseAdd.statusCode);
    if (responseAdd.statusCode == 201) {
      var json = responseAdd.body;
      isUserAdded = true;
      return Users.fromJson(jsonDecode(json));
    } else {
      throw Exception('Failed to add student');
    }
  }
}

class RemoteDeleteUserService {
  Future<void> deleteUser(int userId) async {
    var client = http.Client();
    var uri = Uri.parse(
        'http://localhost:3000/user/$userId'); // Öğrenciye ait ID'yi içeren URL

    var responseDelete = await client.delete(uri);

    if (responseDelete.statusCode == 200) {
      print("Student with ID $userId deleted successfully");
    } else {
      print("Failed to delete student with ID $userId");
    }
  }
}

class RemoteUpdateUserService {
  Future<void> updateUserField(
      int userId, String fieldName, String newValue) async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:3000/user/$userId');

    var requestBody = jsonEncode({
      fieldName: newValue,
    });

    var responseUpdate = await client.patch(
      uri,
      headers: {"Content-Type": "application/json"},
      body: requestBody,
    );

    if (responseUpdate.statusCode == 200) {
      print("Student with ID $userId updated successfully");
      isUserUpdated = true;
    } else {
      print("Failed to update student with ID $userId");
      isUserUpdated = false;
    }
  }
}
