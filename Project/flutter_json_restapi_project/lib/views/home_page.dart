// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_json_restapi_project/Items/drawer.dart';
import 'package:flutter_json_restapi_project/getDatas/getDatas.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int deneme = 0;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    //Fetch data from API
  }

  refleshPage() async {
    print('reflesh page');
    Timer(const Duration(seconds: 1), () {
      setState(() {
        deneme++;
        deneme = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ana Ekran'),
      ),
      drawer: const MyDrawer(),
      body: Visibility(
        visible: isUsersLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
            itemCount: users?.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.amber),
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '${users![index].isim} ${users![index].soyIsim}',
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
