import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:suplo_project_8_12_2020/app/blocs/collection/collection.model.dart';
import 'package:suplo_project_8_12_2020/app/blocs/collection/collection.provider.dart';
import 'package:suplo_project_8_12_2020/app/theme/cards/collection.card.dart';

class EndHome extends StatefulWidget {
  String link;
  EndHome({this.link});

  @override
  _EndHomeState createState() => _EndHomeState();
}

class _EndHomeState extends State<EndHome> {
  CollectionModel collectionEnd;
  @override
  void initState() {
    // TODO: implement initState
    getEndCollection();
    super.initState();
  }

  getEndCollection() async {
    collectionEnd = await CollectionProvider().getModelFromApi();

    if (mounted)
      setState(() {
        collectionEnd = collectionEnd;
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
                  'Áo sơ mi',
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
            height: 350,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children:
                    collectionEnd != null && collectionEnd.products.isNotEmpty
                        ? collectionEnd.products
                            .map(
                              (e) => CollectionCard(product: e),
                            )
                            .toList()
                        : []),
          ),
          Container(
            height: 350,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children:
                  collectionEnd != null && collectionEnd.products.isNotEmpty
                      ? collectionEnd.products
                          .map((e) => CollectionCard(product: e))
                          .toList()
                      : [],
            ),
          ),
        ],
      ),
    );
  }
}
