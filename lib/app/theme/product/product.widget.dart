import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suplo_project_8_12_2020/app/blocs/cart/cart.bloc.dart';
import 'package:suplo_project_8_12_2020/app/blocs/cart/cart.model.dart';
import 'package:suplo_project_8_12_2020/app/blocs/collection/collection.model.dart';
import 'package:suplo_project_8_12_2020/app/blocs/product/product.bloc.dart';
import 'package:suplo_project_8_12_2020/app/blocs/product/product.model.dart';
import 'package:suplo_project_8_12_2020/app/blocs/product/product.provider.dart';
import 'package:suplo_project_8_12_2020/app/theme/cards/choose.color.dart';
import 'package:suplo_project_8_12_2020/app/theme/cards/collection.card.dart';
import 'package:suplo_project_8_12_2020/app/theme/core/cart/cart.widget.dart';
import 'package:suplo_project_8_12_2020/app/theme/core/core.data.dart';
import 'package:suplo_project_8_12_2020/app/theme/local/cart.local.dart';
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
  ProductModel productModel;
  List<Options> option;
  double widthDevice = 300;
  List<ProductModel> products_save = [];
  CartModel cartData = CartModel();
  @override
  void initState() {
    getDetail();
    super.initState();
  }

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
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartWidget(
                                          notBack: false,
                                        )));
                          },
                          child: Icon(
                            CustomIcons.icon_cart,
                            color: Colors.black,
                            size: 22,
                          ),
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
                      ProductInfor(productModel: productModel),
                      _productVariant(),
                      productModel != null
                          ? ProductCare(
                              relatedProduct: productModel.relatedProduct,
                              productModel: productModel,
                            )
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
                          onPressed: () async {
                            // cartBloc.load();
                            CartItem cartItem = CartItem(
                                id: productModel.id,
                                title: productModel.title,
                                image: productModel.images.first,
                                quantity: 1,
                                price: productModel.price);
                            cartBloc.addToCart(cartItem, 1);
                            // CartLocal().saveCart(cartItem, true, false);

                            // bool productInCart = false;

                            // CartItem item = CartItem(
                            //     id: productModel.id,
                            //     title: productModel.title,
                            //     image: productModel.images.first,
                            //     quantity: 1,
                            //     price: productModel.price);
                            // SharedPreferences prefs =
                            //     await SharedPreferences.getInstance();
                            // //debugger();
                            // var cartLocal = prefs.getString('carts');
                            // //print(cartLocal);
                            // if (cartLocal != null) {
                            //   cartData =
                            //       CartModel.fromJson(jsonDecode(cartLocal));
                            // }
                            // if (cartData.items != null) {
                            //   // debugger();
                            //   cartData.items.forEach((element) {
                            //     if (element.id == productModel.id) {
                            //       element.quantity += 1;
                            //       productInCart = true;
                            //     }
                            //   });
                            //   if (!productInCart) {
                            //     cartData.items.add(item);
                            //   }
                            // } else {
                            //   cartData.items = List();
                            //   cartData.items.add(item);
                            // }

                            // //print(cartData.items.first.toJson());
                            // cartData.itemCount = 0;
                            // cartData.totalPrice = 0;
                            // cartData.items.forEach((element) {
                            //   cartData.itemCount =
                            //       cartData.itemCount + element.quantity;
                            //   cartData.totalPrice +=
                            //       element.quantity * element.price;
                            // });

                            // //print('cartData ${cartData.toJson()}');
                            // await prefs.setString(
                            //     'carts', jsonEncode(cartData.toJson()));

                            showDialogAddProductSuccess(
                                'Thêm sản phẩm',
                                'Đã thêm vào giỏ hàng thành công sản phẩm',
                                widthDevice);
                            // print(prefs.getString('carts'));
                          },
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
                            onPressed: () async {
                              CartItem cartItem = CartItem(
                                  id: productModel.id,
                                  title: productModel.title,
                                  image: productModel.images.first,
                                  quantity: 1,
                                  price: productModel.price);
                              await CartLocal().saveCart(cartItem, true, false);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CartWidget(
                                            notBack: false,
                                          )));
                            },
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

  void showDialogAddProductSuccess(
      String title, String description, double widthDevice) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            titlePadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            title: Text(title),
            contentPadding: EdgeInsets.only(bottom: 15),
            content: Container(
              width: widthDevice - 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                    child: Text(description),
                  ),
                  buildProductItemInPopup(),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 40,
                    width: double.infinity,
                    color: Colors.white,
                    child: FlatButton(
                      color: Color(0xFF86744e),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      child: Text(
                        CoreData.textAddToCartSuccessButton,
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  InkWell(
                    child: Align(
                        child: Container(
                            padding: EdgeInsets.only(top: 10, bottom: 2),
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1.5, color: Color(0xFF86744e))),
                            ),
                            child: RichText(
                              text: TextSpan(
                                  text: 'Thanh toán ngay',
                                  style: TextStyle(
                                      color: Color(0xFF86744e),
                                      fontWeight: FontWeight.bold),
                                  children: <WidgetSpan>[
                                    WidgetSpan(
                                        alignment: PlaceholderAlignment.middle,
                                        baseline: TextBaseline.alphabetic,
                                        child: Icon(Icons.arrow_forward,
                                            size: 18, color: Color(0xFF86744e)))
                                  ]),
                            )),
                        alignment: Alignment.center),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartWidget(
                                    // statusSwitchPage: true,
                                    notBack: false,
                                  )));
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget buildProductItemInPopup() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: 60,
              width: 60,
              margin: EdgeInsets.only(right: 10),
              child: Image(
                image: widget?.products?.featuredImage != null &&
                        widget?.products?.featuredImage != ''
                    ? NetworkImage(widget.products.featuredImage)
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
                Text(widget?.products?.title ?? 'No result',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
                SizedBox(
                  height: 3,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: widget?.products?.priceFormat + ' ' ?? 'No rsult',
                      style: TextStyle(
                          color: Color(0xFF86744e),
                          fontWeight: FontWeight.w700,
                          fontSize: 14)),
                ]))
              ],
            ),
          )
        ],
      ),
    );
  }
}
