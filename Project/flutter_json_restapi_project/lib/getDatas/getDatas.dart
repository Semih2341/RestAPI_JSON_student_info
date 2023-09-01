// ignore_for_file: file_names, avoid_print, unused_import

//import 'package:flutter_json_restapi_project/models/Students.dart';
//import 'package:flutter_json_restapi_project/models/Teachers.dart';
//import 'package:flutter_json_restapi_project/models/post.dart';
import 'package:flutter_json_restapi_project/models/Users.dart';

import 'package:flutter_json_restapi_project/services/remote_services.dart';

/*List<Post>? posts;
var isLoaded = false;
List<Teachers>? teachers;
var isTeacherLoaded = false;
List<Students>? students;
var isStudentLoaded = false;
List<Students>? addStudents;
var isStudentAdded = false;*/
List<Users>? users;
var isUsersLoaded = false;
var isUserAdded = false;
var isUserUpdated = false;

void getAllDatas() async {
  /*getPostData();
  print('aşama1');
  getTeacherData();
  print('aşama2');
  getStudentData();
  print('aşama3');*/
  getUserData();
}

getUserData() async {
  users = await RemoteUserService().getUser();
  if (users != null) {
    isUsersLoaded = true;
    print('Post Data loaded? $isUsersLoaded');
  } else {
    print('Posts Not Loaded');
  }
}

void addUserData(String isim, String soyIsim, String telefonNo,
    String kullaniciAdi, String sifre, String avatar) async {
  try {
    var addedUser = await RemoteAddUserService()
        .addUser(isim, soyIsim, telefonNo, kullaniciAdi, sifre, avatar);
    isUserAdded = true;

    print(
        "Added Student: ${addedUser.isim} ${addedUser.soyIsim} ${addedUser.telefonNo} ${addedUser.kullancAdi} ${addedUser.sifre} ${addedUser.avatar}");
  } catch (e) {
    print("Error adding user: $e");
  }
}

void deleteUserData(int userId) async {
  try {
    await RemoteDeleteUserService().deleteUser(userId);
  } catch (e) {
    print("Error deleting user: $e");
  }
}

void updateUserData(int userid, String fieldName, dynamic newValue) async {
  try {
    await RemoteUpdateUserService()
        .updateUserField(userid, fieldName, newValue);
  } catch (e) {
    print("Error updating user: $e");
  }
}

/*getPostData() async {
  posts = await RemoteService().getPosts();
  if (posts != null) {
    isLoaded = true;
    print('Post Data loaded? $isLoaded');
  } else {
    print('Posts Not Loaded');
  }
}

getTeacherData() async {
  teachers = await RemoteTeacherService().getTeacher();
  if (teachers != null) {
    isTeacherLoaded = true;
    print('Teacher Data Loaded?:$isTeacherLoaded');
  } else {
    print('TeacherNull');
  }
}

getStudentData() async {
  students = await RemoteStudentService().getStudent();
  if (students != null) {
    isStudentLoaded = true;
    print('Student Data Loaded?:$isStudentLoaded');
  } else {
    print('StudentNull');
  }
}

void addStudentData(String isim, String soyIsim, String studentid) async {
  try {
    var addedStudent =
        await RemoteAddStudentService().addStudent(isim, soyIsim, studentid);
    print(
        "Added Student: ${addedStudent!.isim} ${addedStudent.soyIsim} ${addedStudent.studentId}");
  } catch (e) {
    print("Error adding student: $e");
  }
}

void deleteStudentData(int studentId) async {
  try {
    await RemoteDeleteStudentService().deleteStudent(studentId);
  } catch (e) {
    print("Error deleting student: $e");
  }
}

void updateStudentData(int studentId, String fieldName, String newValue) async {
  try {
    await RemoteUpdateStudentService()
        .updateStudentField(studentId, fieldName, newValue);
  } catch (e) {
    print("Error updating student: $e");
  }
}

void addTeacherData(String isim, String soyIsim, String studentid) async {
  try {
    var addedStudent =
        await RemoteAddStudentService().addStudent(isim, soyIsim, studentid);
    print(
        "Added Student: ${addedStudent!.isim} ${addedStudent.soyIsim} ${addedStudent.studentId}");
  } catch (e) {
    print("Error adding student: $e");
  }
}*/
