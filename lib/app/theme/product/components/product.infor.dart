import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:suplo_project_8_12_2020/app/blocs/collection/collection.model.dart';
import 'package:suplo_project_8_12_2020/app/blocs/product/product.model.dart';
import 'package:suplo_project_8_12_2020/app/blocs/wishlist/wishlist.bloc.dart';
import 'package:suplo_project_8_12_2020/app/blocs/wishlist/wishlist.model.dart';
import 'package:suplo_project_8_12_2020/app/theme/cards/choose.color.dart';
import 'package:suplo_project_8_12_2020/app/theme/cards/choose.size.dart';
import 'package:suplo_project_8_12_2020/app/theme/local/wishlist.local.dart';

class ProductInfor extends StatefulWidget {
  ProductModel productModel;
  ProductInfor({this.productModel});

  @override
  _ProductInforState createState() => _ProductInforState();
}

class _ProductInforState extends State<ProductInfor> {
  // ProductModel productModel;
  Options options;
  bool _checkFavorite = false;
  CollectionModel collectionModel;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  final List<Color> color = [
    Colors.amberAccent,
    Colors.green,
    Colors.lightBlue
  ];

  final List<String> size = ['S', 'M', 'L', 'XL', 'XXL'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future onSelectNotification(String payload) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Thông báo'),
            content: Text('$payload'),
          );
        });
  }

  didUpdateWidget(ProductInfor oldWidget) {
    // debugger();
    super.didUpdateWidget(oldWidget);
    checkProductInWishlist();
  }

  checkProductInWishlist() async {
    _checkFavorite = await wishBloc.isProductInWishlist(widget.productModel.id);
    if (mounted) {
      setState(() {
        _checkFavorite = _checkFavorite;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 17,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget?.productModel?.title ?? ''}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'BKVAHK29354',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Text(
                            '4,675,000đ',
                            style: TextStyle(
                                color: Colors.grey[700],
                                decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '3,740,000đ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
              Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.only(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _checkFavorite = !_checkFavorite;
                            });

                            Products products = Products(
                              id: widget?.productModel?.id,
                              title: widget?.productModel?.title,
                              featuredImage:
                                  widget?.productModel?.images?.first,
                              price: widget?.productModel?.price,
                              priceFormat: widget?.productModel?.priceFormat,
                              compareAtPrice:
                                  widget?.productModel?.compareAtPrice,
                              compareAtPriceFormat:
                                  widget?.productModel?.compareAtPriceFormat,
                              url: widget?.productModel?.url,
                              handle: widget?.productModel?.handle,
                              sale: widget?.productModel?.sale,
                              available: widget?.productModel?.available,
                            );
                            _checkFavorite == true
                                ? wishBloc.addWish(products, true)
                                : wishBloc.addWish(products, false);
                          },
                          child: _checkFavorite
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.pink,
                                  size: 28,
                                )
                              : Icon(
                                  Icons.favorite_border,
                                  size: 28,
                                ),
                        ),
                        Text(
                          'Yêu thích',
                          style: TextStyle(
                              fontSize: 8,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ))
            ],
          ),
          // Column(
          //   children: [
          //     Row(
          //       children: color.map((e) {
          //         return InkWell(
          //           child:
          //           ChooseColor(
          //             color: e,
          //             hasPressed: false,
          //           ),
          //         );
          //       }).toList(),
          //     ),
          //     SizedBox(
          //       height: 10,
          //     ),
          //     Row(
          //       children: size.map((e) {
          //         return InkWell(
          //           child: ChooseSize(
          //             size: e,
          //             hasCheck: false,
          //           ),
          //         );
          //       }).toList(),
          //     ),
          //   ],
          // ),
          SizedBox(
            height: 20,
          ),
          // Text(
          //   '${widget.productModel.metadescription}',
          //   style: TextStyle(fontSize: 17),
          // )
        ],
      ),
    );
  }
}
