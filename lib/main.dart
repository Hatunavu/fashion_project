import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:suplo_project_8_12_2020/app/theme/core/login/login.widget.dart';
import 'package:suplo_project_8_12_2020/app/theme/home/home.widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Mulish'),
        home: FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Container();
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return HomePage();
            }
            return Container();
          },
        ));
  }
}
