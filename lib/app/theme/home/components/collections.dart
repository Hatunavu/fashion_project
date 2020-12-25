import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suplo_project_8_12_2020/app/blocs/collection/collection.model.dart';
import 'package:suplo_project_8_12_2020/app/blocs/collection/collection.provider.dart';
import 'package:suplo_project_8_12_2020/app/theme/cards/collection.card.dart';
import 'package:suplo_project_8_12_2020/app/theme/product/product.widget.dart';

class CollectionsWidget extends StatefulWidget {
  String link;

  CollectionsWidget({this.link});

  @override
  _CollectionsWidgetState createState() => _CollectionsWidgetState();
}

class _CollectionsWidgetState extends State<CollectionsWidget> {
  CollectionModel collection;
  Products products;

  @override
  void initState() {
    // TODO: implement initState
    getCollection();
    super.initState();
  }

  getCollection() async {
    collection = await CollectionProvider().getModelFromApi();
    if (this.mounted) {
      setState(() {
        collection = collection;
      });
      if (collection != null) {}
    }
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
                  "${collection?.title ?? 'Not result'}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
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
            height: 360,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: collection != null && collection.products.isNotEmpty
                    ? collection.products
                        .map((e) => InkWell(
                              child: CollectionCard(
                                product: e,
                              ),
                              onTap: () async {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProductWidget(
                                          products: e,
                                        )));
                              },
                            ))
                        .toList()
                    : []),
          ),
        ],
      ),
    );
  }
}
