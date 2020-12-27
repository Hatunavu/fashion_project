import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:suplo_project_8_12_2020/app/blocs/collection/collection.model.dart';
import 'package:suplo_project_8_12_2020/app/blocs/collection/collection.provider.dart';
import 'package:suplo_project_8_12_2020/app/blocs/product/product.care.model.dart';
import 'package:suplo_project_8_12_2020/app/blocs/product/product.provider.dart';
import 'package:suplo_project_8_12_2020/app/theme/cards/product.care.card.dart';

class ProductCare extends StatefulWidget {
  String link;

  ProductCare({this.link});
  @override
  _ProductCareState createState() => _ProductCareState();
}

class _ProductCareState extends State<ProductCare> {
  ProductCareModel collection;
  @override
  void initState() {
    // TODO: implement initState
    getCollection();
    super.initState();
  }

  getCollection() async {
    collection = await ProductProvider().getCareFromApi(widget.link);
    if (this.mounted)
      setState(() {
        collection = collection;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Có thể bạn quan tâm',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Xem tất cả>',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
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
                children: collection != null && collection.products.isNotEmpty
                    ? collection.products
                        .map((e) => ProductCareCard(
                              product: e,
                            ))
                        .toList()
                    : []),
          ),
        ],
      ),
    );
  }
}
