import 'package:flutter/material.dart';

class MidCard extends StatelessWidget {
  String image;
  MidCard(this.image);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        image != null
            ? Image.asset(
                image,
                fit: BoxFit.cover,
              )
            : Container(),
        SizedBox(
          height: 20,
        ),
        Text(
          'BỘ VESTON',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Text(
          'Dành cho buổi sự kiện',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        )
      ],
    );
  }
}
