import 'package:flutter/material.dart';
import 'package:suplo_project_8_12_2020/app/blocs/collection/collection.model.dart';
import 'package:suplo_project_8_12_2020/app/theme/product/product.widget.dart';

class CollectionList extends StatelessWidget {
  Products products;
  CollectionList({this.products});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 0),
          margin: EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 60,
                  width: 60,
                  margin: EdgeInsets.only(right: 10),
                  child: Image(
                    image: products?.featuredImage != null &&
                            products?.featuredImage != ''
                        ? NetworkImage(products.featuredImage)
                        : Text('No result'),
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(products?.title ?? 'No result',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14.0),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                    SizedBox(
                      height: 3,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: products?.priceFormat + ' ' ?? 'No rsult',
                          style: TextStyle(
                              color: Color(0xFF86744e),
                              fontWeight: FontWeight.w700,
                              fontSize: 14)),
                      TextSpan(
                          text: products?.compareAtPriceFormat ?? 'No result',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Color(0xFF333333).withOpacity(.6),
                            fontSize: 10,
                          ))
                    ]))
                  ],
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.only(right: 15, top: 59),
            child: Icon(
              Icons.add_circle_outline,
              color: Colors.grey,
              size: 22,
            ),
          ),
        )
      ],
    );
  }
}
