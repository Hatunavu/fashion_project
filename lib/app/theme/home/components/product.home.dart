import 'package:flutter/material.dart';

import '../../../../custom_icons_icons.dart';

class ProductHome extends StatefulWidget {
  final bool notBack;
  ProductHome({this.notBack});
  @override
  _ProductHomeState createState() => _ProductHomeState();
}

class _ProductHomeState extends State<ProductHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: widget.notBack == false
            ? InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              )
            : null,
        automaticallyImplyLeading: widget.notBack == false ? true : false,
        elevation: 0.5,
        brightness: Brightness.light,
        centerTitle: true,
        titleSpacing: 0,
        title: Container(
          height: 35,
          padding: EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          margin: EdgeInsets.only(right: 15, top: 10, bottom: 10, left: 15),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color.fromRGBO(244, 243, 243, 1),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: TextField(
            textAlign: TextAlign.left,
            strutStyle: StrutStyle(fontSize: 16, height: 1.5),
            autocorrect: false,
            style: TextStyle(height: 1.5, fontSize: 14, color: Colors.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search you\'re looking for',
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(.4)),
                icon: Icon(
                  CustomIcons.icon_search,
                  size: 20,
                )),
          ),
        ),
        actions: [
          Container(
            height: 35,
            width: 50,
            child: Icon(
              CustomIcons.icon_cart,
              color: Colors.black,
              size: 25,
            ),
          )
        ],
      ),
      body: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 5,
            color: Color.fromRGBO(244, 243, 243, 1),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.grey[400], width: 0.5))),
                    height: 100,
                    // color: Colors.blue,
                  ),
                );
              },
              itemCount: 10,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
