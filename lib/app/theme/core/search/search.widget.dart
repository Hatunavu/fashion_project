import 'package:flutter/material.dart';
import 'package:suplo_project_8_12_2020/custom_icons_icons.dart';

class SearchWidget extends StatefulWidget {
  final bool notBack;
  SearchWidget({this.notBack});
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.notBack == false
          ? AppBar(
              backgroundColor: Colors.white,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              automaticallyImplyLeading: false,
              elevation: 0,
              brightness: Brightness.light,
              centerTitle: true,
              titleSpacing: 0,
              title: Container(
                height: 35,
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                margin:
                    EdgeInsets.only(right: 15, top: 10, bottom: 10, left: 15),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(244, 243, 243, 1),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: TextField(
                  textAlign: TextAlign.left,
                  strutStyle: StrutStyle(fontSize: 16, height: 1.5),
                  autocorrect: false,
                  style:
                      TextStyle(height: 1.5, fontSize: 14, color: Colors.black),
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
            )
          : AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              elevation: 0,
              brightness: Brightness.light,
              centerTitle: true,
              titleSpacing: 0,
              title: Container(
                height: 35,
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                margin:
                    EdgeInsets.only(right: 15, top: 10, bottom: 10, left: 15),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(244, 243, 243, 1),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: TextField(
                  textAlign: TextAlign.left,
                  strutStyle: StrutStyle(fontSize: 16, height: 1.5),
                  autocorrect: false,
                  style:
                      TextStyle(height: 1.5, fontSize: 14, color: Colors.black),
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
            ),
    );
  }
}
