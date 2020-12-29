import 'package:flutter/material.dart';
import 'package:suplo_project_8_12_2020/app/blocs/collection/collection.model.dart';
import 'package:suplo_project_8_12_2020/app/blocs/product/product.model.dart';

class CareCard extends StatelessWidget {
  RelatedProduct product;
  CareCard({this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
      child: AspectRatio(
        aspectRatio: 1.57 / 3,
        child: Column(
          children: [
            Image.network(product.featuredImage),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Column(
                children: [
                  Text(
                    '${product.title}',
                    style: TextStyle(fontSize: 17),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${product.compareAtPriceFormat}',
                                maxLines: 1,
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
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [Icon(Icons.add_circle_outline)],
                      ))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      color: Colors.white,
      elevation: 0,
    );
  }
}
