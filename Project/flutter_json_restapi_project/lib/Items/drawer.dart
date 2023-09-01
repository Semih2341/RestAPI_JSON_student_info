// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_json_restapi_project/getDatas/getDatas.dart';
import 'package:flutter_json_restapi_project/views/login_page.dart';
import 'package:flutter_json_restapi_project/views/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Column(children: [
            DrawerHeader(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                        radius: 47,
                        backgroundImage: NetworkImage(users![userIndex].avatar),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            users![userIndex].isim,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(users![userIndex].soyIsim),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Hesap Ayarları'),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SettingsPage())), // Bu, çekmecenin kapatılmasını sağlar
            ),
          ]),
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text('Çıkış Yap'),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: ((context) => loginPage())),
                      (route) => false);
                },
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
