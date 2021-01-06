import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:suplo_project_8_12_2020/app/blocs/collection/collection.model.dart';
import 'package:suplo_project_8_12_2020/app/blocs/wishlist/wishlist.model.dart';
import 'package:suplo_project_8_12_2020/app/theme/cards/collection.card.dart';
import 'package:suplo_project_8_12_2020/app/theme/local/wishlist.local.dart';
import 'package:suplo_project_8_12_2020/app/theme/product/product.widget.dart';

class WishlistWidget extends StatefulWidget {
  // List<Wishlist> wishlist;
  // WishlistWidget({this.wishlist});
  @override
  _WishlistWidgetState createState() => _WishlistWidgetState();
}

class _WishlistWidgetState extends State<WishlistWidget> {
  CollectionModel collectionModel;

  getLocal() async {
    // debugger();
    var response = await WishlistLocal().loadWishlist();
    if (response != null) {
      if (mounted) {
        setState(() {
          collectionModel = response;
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 243, 243, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        title: Text('Yêu thích',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 15,
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.54 / 3,
              ),
              delegate:
                  collectionModel != null && collectionModel.products.length > 0
                      ? SliverChildListDelegate(collectionModel.products
                          .map((product) => InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ProductWidget(
                                            products: product,
                                          )));
                                },
                                child: CollectionCard(
                                  product: product,
                                ),
                              ))
                          .toList())
                      : SliverChildListDelegate([]),
            )
          ],
        ),
      ),
    );
  }
}
