// ignore_for_file: camel_case_types, avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_json_restapi_project/views/home_page.dart';
import 'package:flutter_json_restapi_project/views/register_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../getDatas/getDatas.dart';

final Uri _url = Uri.parse('https://flutter.dev');

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

final _usernameController = TextEditingController();
final _passwordController = TextEditingController();
bool _userFound = false;
int deneme = 0;
int userIndex = 0;
void girisBasarili(BuildContext context) {
  print('griildi');
  showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: AlertDialog(
          title: Text(
            'Giriş Başarılı!',
            style: TextStyle(fontSize: 25),
          ),
          backgroundColor: Colors.greenAccent,
          icon: Icon(
            Icons.check_circle,
            size: 100,
            color: Color.fromARGB(255, 19, 119, 23),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Giriş Ekranına Yönlendiriliyorsunuz.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      );
    },
  );
  Timer(
    Duration(seconds: 1),
    () {
      Navigator.pop(context);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    },
  );
}

void sifremiUnuttum() async {
  print('ŞifremiUnuttum');
}

void girisBasarisiz(BuildContext context) {
  print('girilmedi');
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.red,
        title: Center(child: Text('Giriş Başarısız!')),
        icon: Icon(
          Icons.dangerous,
          size: 100,
        ),
        iconColor: Color.fromARGB(255, 112, 28, 22),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Lütfen Bilgilerinizi Kontrol Edin.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      );
    },
  );
}

class _loginPageState extends State<loginPage> {
  @override
  void initState() {
    super.initState();
    //Fetch data from API
    getAllDatas();
    refleshPage();
  }

  refleshPage() async {
    print('reflesh page');
    Timer(const Duration(seconds: 1), () {
      print('All Pages Installed?$isUsersLoaded:');
      if (isUsersLoaded) {
        setState(() {
          deneme++;
          deneme = 0;
        });
      } else {
        print('All Pages Installed$isUsersLoaded');
        getAllDatas();
        refleshPage();
      }
    });
  }

  girisyap() async {
    //addStudentData('osman', 'tok', '431');
    //deleteStudentData(3);
    //updateStudentData(1, "Isim", "Abdurrezzak");
    for (int i = 0; i < users!.length; i++) {
      if (users![i].kullancAdi == _usernameController.text &&
          users![i].sifre == _passwordController.text) {
        _userFound = true;
        userIndex = i;
        print('Giriş Başarılı');
        print('Kullanıcının bulunduğu yer: $i');
        girisBasarili(context);
      }
      if (i == users!.length - 1 && _userFound == false) {
        print('Kullanıcı Bulunamadı');
        girisBasarisiz(context);
      }
    }
    /*if (i != users!.length) {
      while (_usernameController.text != users![i].kullancAdi &&
          _passwordController.text != users![i].sifre) {
        print('aranıyor; ${users![i].isim}');
        i++;
      }
      if (_usernameController.text == users![i].kullancAdi &&
          _passwordController.text == users![i].sifre) {
        print('Giriş Başarılı');
        print('Kullanıcının bulunduğu yer: $i');
      } else {
        i = 0;
        print('Kullanıcı Bulunamadı');
        print('i 0 landı');
      }
    }*/
  }

  kayitOl() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const RegisterPage()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Container(
                height: 95,
                child: Image.network(
                    'https://ventura.com.tr/wp-content/uploads/2019/12/2.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            //silme gelcek;
                            _usernameController.clear();
                          },
                          icon: const Icon(Icons.clear),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Şifre',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            //silme gelcek;
                            _passwordController.clear();
                          },
                          icon: const Icon(Icons.clear),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (_usernameController.text != '' &&
                                  _passwordController.text != '') {
                                girisyap();
                              } else {
                                girisBasarisiz(context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.lightBlue,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10)),
                            child: const Text(
                              'Giriş',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ElevatedButton(
                              onPressed: kayitOl,
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.lightBlue,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10)),
                              child: const Text(
                                'Kayıt Ol',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        _launchUrl();
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.grey[200],
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        'Şifremi Unuttum',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
