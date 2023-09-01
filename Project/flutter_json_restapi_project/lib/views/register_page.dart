// ignore_for_file: prefer_const_constructors, avoid_print, unused_import

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_json_restapi_project/getDatas/getDatas.dart';
import 'package:flutter_json_restapi_project/views/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _phonenumberController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _avatarController = TextEditingController();

  void _registerSuccessed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.greenAccent,
          title: Center(child: Text('Kayıt Başarılı')),
          content: Text(
              'Kaydınız Başarılı Bir Şekilde Oluşturulmuştur. Giriş Ekranına Yönlendiriliyorsunuz!'),
          icon: Icon(
            Icons.check_circle,
            size: 100,
          ),
          iconColor: Color.fromARGB(255, 19, 119, 23),
        );
      },
    );
    Timer(Duration(seconds: 2), () {
      // Navigator.pop(context);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => loginPage()));
    });
  }

  void _registerFailed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.red,
          title: Center(child: Text('Kayıt Başarısız')),
          content: Text('Bir Şeyler Ters Gitti Daha Sonra Tekrar Deneyin'),
          icon: Icon(
            Icons.dangerous,
            size: 100,
          ),
          iconColor: Color.fromARGB(255, 112, 28, 22),
        );
      },
    );
  }

  kayitOl() {
    addUserData(
      _nameController.text,
      _surnameController.text,
      _phonenumberController.text,
      _usernameController.text,
      _passwordController.text,
      _avatarController.text,
    );
    Timer(
      Duration(milliseconds: 30),
      () {
        print(isUserAdded);
        if (isUserAdded) {
          _registerSuccessed(context);
        } else {
          _registerFailed(context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Adınız',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    //silme gelcek;
                    _nameController.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 50, right: 50, bottom: 10, top: 0),
            child: TextField(
              controller: _surnameController,
              decoration: InputDecoration(
                labelText: 'Soy Adınız',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    //silme gelcek;
                    _surnameController.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 50, right: 50, bottom: 10, top: 0),
            child: TextField(
              controller: _phonenumberController,
              decoration: InputDecoration(
                labelText: 'Telefon Numaranız',
                prefixText: '+90',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    //silme gelcek;
                    _phonenumberController.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 50, right: 50, bottom: 10, top: 0),
            child: TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Kullanıcı Adınız',
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
            padding:
                const EdgeInsets.only(left: 50, right: 50, bottom: 10, top: 0),
            child: TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Şifreniz',
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
            padding:
                const EdgeInsets.only(left: 50, right: 50, bottom: 10, top: 0),
            child: TextField(
              controller: _avatarController,
              decoration: InputDecoration(
                labelText: 'Avatar URL',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    //silme gelcek;
                    _avatarController.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 40),
            child: ElevatedButton(
              onPressed: kayitOl,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.lightBlue,
                padding:
                    const EdgeInsets.symmetric(vertical: 13, horizontal: 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'Kayıt Ol',
                style: TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
