import 'package:flutter/material.dart';

class MainSlide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //alignment: Alignment.topRight,
      width: double.infinity,
      height: 524,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/img_main_slider_1.png'))),
    );
  }
}
