import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:suplo_project_8_12_2020/app/blocs/product/product.model.dart';
import 'package:suplo_project_8_12_2020/app/theme/cards/product.care.card.dart';

class ProductCare extends StatefulWidget {
  ProductModel productModel;
  List<RelatedProduct> relatedProduct;

  ProductCare({this.relatedProduct, this.productModel});
  @override
  _ProductCareState createState() => _ProductCareState();
}

class _ProductCareState extends State<ProductCare> {
  @override
  Widget build(BuildContext context) {
    final relatedProduct = widget.relatedProduct;
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
                InkWell(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => );
                  },
                  child: Text(
                    'Xem tất cả>',
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
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
                children: relatedProduct != null
                    ? relatedProduct
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
