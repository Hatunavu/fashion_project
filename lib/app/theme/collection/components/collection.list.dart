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
          margin: EdgeInsets.only(left: 15, top: 5, bottom: 5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 70,
                  width: 70,
                  child: Image(
                    image: products?.featuredImage != null &&
                            products?.featuredImage != ''
                        ? NetworkImage(products.featuredImage)
                        : Text('No result'),
                    fit: BoxFit.cover,
                  )),

              // Stack(
              //   overflow: Overflow.visible,
              //   children: [
              //     InkWell(
              //       onTap: () {
              //         Navigator.of(context).push(MaterialPageRoute(
              //             builder: (context) => ProductWidget()));
              //       },
              //       // child:
              //       // FadeInImage(
              //       //   fadeInDuration: Duration(milliseconds: 100),
              //       //   fadeOutDuration: Duration(milliseconds: 100),
              //       //   height: 80,
              //       //   width: 70,
              //       //   image: products?.featuredImage != null &&
              //       //           products?.featuredImage != ''
              //       //       ? NetworkImage(products.featuredImage)
              //       //       : Text('No result'),
              //       //
              //     ),
              //     products?.sale != null && products?.sale != '-0%'
              //         ? Positioned(
              //             bottom: 2,
              //             left: -10,
              //             child: Container(
              //                 width: 30,
              //                 height: 18,
              //                 alignment: Alignment.center,
              //                 decoration: BoxDecoration(
              //                     color: Color(0xFF484105),
              //                     borderRadius: BorderRadius.only(
              //                         topRight: Radius.circular(4),
              //                         bottomRight: Radius.circular(4))),
              //                 child: Text(
              //                   products?.sale?.toString(),
              //                   style: TextStyle(
              //                       color: Colors.white,
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 11),
              //                   textAlign: TextAlign.center,
              //                 )))
              //         : Container(),
              //   ],
              // ),

              SizedBox(
                height: 10,
              ),
              Expanded(
                //   child: InkWell(
                // onTap: () {
                //   Navigator.of(context).push(
                //       MaterialPageRoute(builder: (context) => ProductWidget()));
                // },
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
                  ],
                ),
              )
              // )
            ],
          ),
        )
      ],
    );
  }
}
