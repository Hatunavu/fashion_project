import 'package:flutter/material.dart';
import 'package:suplo_project_8_12_2020/app/blocs/collection/collection.model.dart';

class CollectionCard extends StatelessWidget {
  Products product;
  CollectionCard({this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: AspectRatio(
        aspectRatio: 1.45 / 3,
        child: Column(
          children: [
            Image.network(product.featuredImage),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    '${product.title}',
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${product.compareAtPriceFormat}',
                                style: TextStyle(
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough),
                              ),
                              Text(
                                '${product.priceFormat}',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                      Expanded(child: Icon(Icons.add_circle_outline))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      color: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.only(right: 10),
    );
  }
}
