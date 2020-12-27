import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:suplo_project_8_12_2020/app/blocs/news/new.model.dart';
import 'package:suplo_project_8_12_2020/app/blocs/news/new.provider.dart';
import 'package:suplo_project_8_12_2020/app/theme/cards/news.card.dart';

class News extends StatefulWidget {
  String link;
  News({this.link});
  // CollectionModel2 collectionModel2;
  // News({this.collectionModel2});

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  NewModel newData;
  @override
  void initState() {
    // TODO: implement initState
    getNew();
    super.initState();
  }

  getNew() async {
    newData = await NewProvider().getNewFromApi();
    if (mounted)
      setState(() {
        newData = newData;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${newData?.title ?? 'Not result'}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Xem tất cả>',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 290,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: newData != null && newData.articles.isNotEmpty
                    ? newData.articles
                        .map((e) => NewCard(
                              articles: e,
                            ))
                        .toList()
                    : []),
          ),
        ],
      ),
    );
  }
}
