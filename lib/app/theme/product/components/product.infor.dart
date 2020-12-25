import 'package:flutter/material.dart';
import 'package:suplo_project_8_12_2020/app/blocs/product/product.model.dart';
import 'package:suplo_project_8_12_2020/app/theme/cards/choose.color.dart';
import 'package:suplo_project_8_12_2020/app/theme/cards/choose.size.dart';

class ProductInfor extends StatefulWidget {
  ProductModel productModel;
  ProductInfor({this.productModel});

  @override
  _ProductInforState createState() => _ProductInforState();
}

class _ProductInforState extends State<ProductInfor> {
  // ProductModel productModel;
  Options options;

  final List<Color> color = [
    Colors.amberAccent,
    Colors.green,
    Colors.lightBlue
  ];

  final List<String> size = ['S', 'M', 'L', 'XL', 'XXL'];

  bool _checkFavorite = false;

  @override
  Widget build(BuildContext context) {
    //print('${widget.productModel.options}');
    // productModel = widget.productModel;
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
