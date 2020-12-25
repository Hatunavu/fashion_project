import 'package:flutter/material.dart';
import 'package:suplo_project_8_12_2020/app/theme/cards/mid.card.dart';

class MidProd extends StatelessWidget {
  final List<String> _listItem = [
    'assets/images/img_category_1.png',
    'assets/images/img_category_1.png',
    'assets/images/img_category_1.png',
    'assets/images/img_category_1.png',
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Image.asset('assets/images/img_banner_center_1.png'),
        SizedBox(
          height: 10,
        ),
        Wrap(
          runSpacing: 10,
          spacing: 10,
          // primary: false,
          // crossAxisCount: 2,
          // childAspectRatio: 1.7 / 3,
          // padding: const EdgeInsets.only(top: 10, left: 0),
          // mainAxisSpacing: 4.0,
          // crossAxisSpacing: 4.0,
          children: _listItem.map((item) {
            return Container(width: (width - 50) / 2, child: MidCard(item));
          }).toList(),
        )
      ])),
    );
  }
}
