import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suplo_project_8_12_2020/app/blocs/collection/collection.model.dart';
import 'package:suplo_project_8_12_2020/app/blocs/product/product.bloc.dart';
import 'package:suplo_project_8_12_2020/app/blocs/product/product.model.dart';
import 'package:suplo_project_8_12_2020/app/blocs/product/product.provider.dart';
import 'package:suplo_project_8_12_2020/app/theme/cards/choose.color.dart';
import 'package:suplo_project_8_12_2020/app/theme/cards/collection.card.dart';
import 'package:suplo_project_8_12_2020/app/theme/core/core.data.dart';
import 'package:suplo_project_8_12_2020/app/theme/product/components/product.care.dart';
import 'package:suplo_project_8_12_2020/app/theme/product/components/product.infor.dart';
import 'package:suplo_project_8_12_2020/app/theme/product/components/product.seen.dart';
import 'package:suplo_project_8_12_2020/custom_icons_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductWidget extends StatefulWidget {
  Products products;
  ProductWidget({this.products});

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  ProductModel productModel;
  List<Options> option;
  List<ProductModel> products_save = [];
  //List<ProductModel> reverseSave = products_save.reversed.toList();
  var _counter;
  @override
  void initState() {
    //sharedPref.remove('product_seen');
    getDetail();
    super.initState();
  }

  // Future<void> _incrementCounter() async {
  //   //debugger();
  //   final SharedPreferences prefs = await _prefs;
  //   prefs.setString('product_seen', jsonEncode(productModel));

  //   final String counter = prefs.getString('product_seen');
  //   //print(counter);
  // }

  saveProduct(ProductModel productModel) async {
    //debugger();

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var response = prefs.getString('product_seen');
    if (response != null) {
      jsonDecode(response).forEach((item) {
        products_save.add(ProductModel.fromJson(item));
      });
      for (var i = 0; i < products_save.length; i++) {
        if (products_save[i].id == productModel.id) {
          products_save.removeAt(i);
        }
      }
      if (products_save.length > 4) {
        products_save.removeAt(products_save.length - 1);
      }
      //var productSeen = jsonDecode(response);
      products_save.insert(0, productModel);
    } else {
      products_save.insert(0, productModel);
    }
    setState(() {
      products_save = products_save;
    });
    await prefs.setString('product_seen', jsonEncode(products_save));
  }

  getDetail() async {
    productModel =
        await ProductProvider().getDetailFromApi(widget.products.url);
    if (this.mounted) {
      setState(() {
        productModel = productModel;
      });
      if (productModel != null) {
        saveProduct(productModel);
      }
    }
  }

  Widget _productVariant() {
    option = productModel?.options ?? [];
    return Container(
      //margin: EdgeInsets.only(bottom: 10, top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: option != null
            ? option.map((option) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        option.name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    // Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 15),
                    //   child: Wrap(
                    //     spacing: 20,
                    //     // runSpacing: 20,
                    //     children: option.values.map((value) {
                    //       return Text(value);
                    //     }).toList(),
                    //   ),
                    // )
                  ],
                );
              }).toList()
            : <Widget>[],
      ),
    );
  }

  Widget _rowVariant(Options option, ProductModel product, double withDevide) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(244, 243, 243, 1),
        body: Stack(children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 450,
                backgroundColor: Colors.white,
                elevation: 0,
                automaticallyImplyLeading: false,
                leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                pinned: true,
                actions: [
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Row(
                      children: [
                        Icon(
                          CustomIcons.icon_cart,
                          color: Colors.black,
                          size: 22,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          CustomIcons.icon_share_ios,
                          color: Colors.black,
                          size: 22,
                        )
                      ],
                    ),
                  )
                ],
                flexibleSpace: FlexibleSpaceBar(background: Builder(
                  builder: (context) {
                    final double height = MediaQuery.of(context).size.height;
                    return CarouselSlider(
                      options: CarouselOptions(
                          height: height, autoPlay: true, viewportFraction: 1),
                      items:
                          productModel != null && productModel.images.isNotEmpty
                              ? productModel.images.map(
                                  (i) {
                                    return Container(
                                        width: double.infinity,
                                        decoration:
                                            BoxDecoration(color: Colors.white),
                                        child: Image.network(
                                          i,
                                          fit: BoxFit.cover,
                                          height: height,
                                        ));
                                  },
                                ).toList()
                              : [],
                    );
                  },
                )),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Padding(
                  padding: EdgeInsets.only(bottom: 70),
                  child: Column(
                    children: [
                      ProductInfor(
                        productModel: productModel,
                      ),
                      _productVariant(),
                      productModel != null
                          ? ProductCare(link: productModel.relatedLink)
                          : Container(),
                      ProductSeen(
                        products: products_save,
                      )
                    ],
                  ),
                )
              ]))
            ],
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.white,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black)),
                          onPressed: () {},
                          child: Container(
                            padding: EdgeInsets.all(14.7),
                            child: Text(
                              'Thêm vào giỏ',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                          color: Colors.black,
                          child: FlatButton(
                            onPressed: () {},
                            child: Text(
                              'Mua ngay',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ]));
  }
}
