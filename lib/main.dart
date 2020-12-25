import 'package:flutter/material.dart';
import 'package:suplo_project_8_12_2020/app/theme/home/home.widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Mulish'),
        home: HomePage());
  }
}
