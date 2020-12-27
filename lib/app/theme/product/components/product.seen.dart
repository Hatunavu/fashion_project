import 'package:flutter/material.dart';
import 'package:suplo_project_8_12_2020/app/blocs/collection/collection.model.dart';
import 'package:suplo_project_8_12_2020/app/blocs/product/product.model.dart';
import 'package:suplo_project_8_12_2020/app/theme/cards/collection.card.dart';

class ProductSeen extends StatefulWidget {
  List<ProductModel> products;

  ProductSeen({this.products});
  @override
  _ProductSeenState createState() => _ProductSeenState();
}

class _ProductSeenState extends State<ProductSeen> {
  CollectionModel collection;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> products = widget.products;
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
                  'Sản phẩm đã xem',
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
                children: products != null && products.isNotEmpty
                    ? products.map((e) {
                        Products data = Products(
                            url: e.url,
                            id: e.id,
                            title: e.title,
                            handle: e.handle,
                            compareAtPrice: e.compareAtPrice,
                            price: e.price,
                            priceFormat: e.priceFormat,
                            available: e.available,
                            featuredImage:
                                (e?.images != null && e.images.length > 0)
                                    ? e.images[0]
                                    : []);

                        //print(data.toJson());
                        return CollectionCard(product: data);
                      }).toList()
                    : []),
          ),
        ],
      ),
    );
  }
}
