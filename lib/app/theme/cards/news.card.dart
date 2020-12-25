import 'package:flutter/material.dart';
import 'package:suplo_project_8_12_2020/app/blocs/news/new.model.dart';

class NewCard extends StatelessWidget {
  Articles articles;
  NewCard({this.articles});

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Container(
        width: 290,
        margin: EdgeInsets.only(right: 12),
        child: Column(
          children: [
            Image.network(
              articles.image,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '${articles.title}',
              style: TextStyle(fontSize: 17),
            )
          ],
        ),
      ),
    ]);
  }
}
