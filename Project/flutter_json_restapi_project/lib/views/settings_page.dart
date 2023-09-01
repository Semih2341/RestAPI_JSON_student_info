// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_json_restapi_project/getDatas/getDatas.dart';
import 'package:flutter_json_restapi_project/views/login_page.dart';

final _nameController = TextEditingController();
final _surnameController = TextEditingController();
final _phonenumberController = TextEditingController();
final _usernameController = TextEditingController();
final _passwordController = TextEditingController();
final _avatarController = TextEditingController();
List<TextEditingController> controllerList = [
  _nameController,
  _surnameController,
  _phonenumberController,
  _usernameController,
  _passwordController,
  _avatarController,
];
List<String> usersDatabaseParameters = [
  "Isim",
  "Soy_isim",
  "TelefonNo",
  "KullanıcıAdı",
  "Sifre",
  "Avatar"
];
updateUser(BuildContext context) {
  print(usersDatabaseParameters.length);
  for (int x = 0; x < controllerList.length; x++) {
    if (controllerList[x].text != users![userIndex].isim &&
        controllerList[x].text != '') {
      updateUserData(users![userIndex].id, usersDatabaseParameters[x],
          controllerList[x].text);
      controllerList[x].clear();
    }
  }
  Timer(
    Duration(milliseconds: 30),
    () {
      _userUpdatedDialogShower(context);
      Timer(
        Duration(seconds: 1),
        () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
      );
    },
  );
}

void updateUserAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: AlertDialog(
          title: Text(
            'Bilgileri Güncellemek İstediğinize Emin misiniz',
            style: TextStyle(fontSize: 25),
          ),
          backgroundColor: Colors.greenAccent,
          icon: Icon(
            Icons.question_mark,
            size: 100,
            color: Color.fromARGB(255, 19, 119, 23),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  updateUser(context);
                },
                child: Text('Evet'),
                color: Colors.red,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Hayır'),
                color: Colors.grey[100],
              )
            ],
          ),
        ),
      );
    },
  );
}

void deleteUseralert(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: AlertDialog(
          title: Text(
            'Hesabınızı Silmek İstediğinize Emin misiniz',
            style: TextStyle(fontSize: 25),
          ),
          backgroundColor: Colors.greenAccent,
          icon: Icon(
            Icons.question_mark,
            size: 100,
            color: Color.fromARGB(255, 19, 119, 23),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  deleteUser(context);
                },
                child: Text('Evet'),
                color: Colors.red,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Hayır'),
                color: Colors.grey[100],
              )
            ],
          ),
        ),
      );
    },
  );
}

void deleteUser(BuildContext context) {
  deleteUserData(users![userIndex].id);
  showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: AlertDialog(
          title: Text(
            'Hesabınız Silindi!',
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
  Timer(Duration(seconds: 1), () {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: ((context) => loginPage())),
        (route) => false);
  });
}

void _userUpdatedDialogShower(BuildContext context) {
  if (isUserUpdated) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.greenAccent,
          title: Center(
              child: Text('Bilgi(ler) Başarılı Bir Şekilde Güncellendi!')),
          icon: Icon(
            Icons.check_circle,
            size: 100,
          ),
          iconColor: Color.fromARGB(255, 19, 119, 23),
        );
      },
    );
  } else {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.red,
          title: Center(child: Text('Bilgi(ler) Güncellenemedi!')),
          icon: Icon(
            Icons.dangerous,
            size: 100,
          ),
          iconColor: Color.fromARGB(255, 112, 28, 22),
        );
      },
    );
  }
  isUserAdded = false;
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  refleshPage() async {
    getAllDatas();

    Timer(Duration(milliseconds: 30), () {
      print('All Pages Installed?$isUsersLoaded:');
      if (isUserUpdated) {
        setState(() {
          deneme++;
        });
      } else {
        refleshPage();
        print('All Pages Installed?:$isUsersLoaded');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 50, right: 50, bottom: 10, top: 50),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: users![userIndex].isim,
                labelText: 'İsim',
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
                hintText: users![userIndex].soyIsim,
                labelText: 'Soy İsim',
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
                hintText: users![userIndex].telefonNo,
                labelText: 'Telefon Numarası',
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
                labelText: 'Kullancı Adı',
                hintText: users![userIndex].kullancAdi,
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
                labelText: 'Şifre',
                hintText: users![userIndex].sifre,
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
                hintText: users![userIndex].avatar,
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
            padding: const EdgeInsets.only(left: 50, right: 50, top: 15),
            child: ElevatedButton(
              onPressed: () {
                updateUserAlert(context);
                refleshPage();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.lightBlue,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'Bilgi(leri) Güncelle',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 80),
            child: ElevatedButton(
              onPressed: () => deleteUseralert(context),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.grey[200],
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'Hesabı Sil',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
