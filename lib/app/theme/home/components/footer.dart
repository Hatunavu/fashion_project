import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:suplo_project_8_12_2020/app/blocs/footer/footer.model.dart';
import 'package:suplo_project_8_12_2020/app/blocs/footer/footer.provider.dart';

class FooterPage extends StatefulWidget {
  String url;
  FooterPage({this.url});
  @override
  _FooterPageState createState() => _FooterPageState();
}

class _FooterPageState extends State<FooterPage> {
  FooterModel footer;
  List<MenuLink> menuLink;

  @override
  void initState() {
    // TODO: implement initState
    getFooter();
    super.initState();
  }

  getFooter() async {
    footer = await FooterProvider().getFooter(widget.url);
    menuLink = footer.menu.menuLink;
    if (this.mounted) {
      setState(() {
        footer = footer;
      });
      if (footer != null) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              padding: EdgeInsets.only(right: 12, left: 12),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(footer?.bgImage?.image),
                      fit: BoxFit.fitHeight)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        height: MediaQuery.of(context).size.width / 2.5,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    footer?.information?.imageLogo))),
                      )
                    ],
                  ),
                  information(
                    Icons.home,
                    footer.information.address,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  information(
                      Icons.phone_android, footer.information.phoneNumber),
                  SizedBox(
                    height: 5,
                  ),
                  information(Icons.email, footer.information.email),
                  SizedBox(
                    height: 20,
                  ),
                  titleMain(footer.menu.menuTitle),
                  Container(
                    height: 180,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text('${menuLink[index].linkTitle}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                        );
                      },
                      itemCount: menuLink.length,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  titleMain(footer.subcribe.title),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    footer.subcribe.description,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  TextField(
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    decoration: InputDecoration(
                      border: new UnderlineInputBorder(
                          borderSide: new BorderSide(color: Colors.red)),
                      hintText: footer.subcribe.placeholder,
                      hintStyle: TextStyle(color: Colors.white, fontSize: 18),
                      suffixIcon: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      iconSocial(MdiIcons.facebook),
                      iconSocial(MdiIcons.twitter),
                      iconSocial(MdiIcons.instagram),
                      iconSocial(MdiIcons.googlePlus),
                      iconSocial(MdiIcons.youtube)
                    ],
                  ),
                  titleMain(footer.gallery.title),
                  imageSuplo()
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget information(IconData icon, String infor) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 25,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          infor,
          maxLines: 2,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget titleMain(String title) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget iconSocial(IconData icon) {
    return Container(
      padding: EdgeInsets.only(right: 10, top: 20, bottom: 20),
      child: Icon(
        icon,
        color: Colors.white,
        size: 45,
      ),
    );
  }

  Widget imageSuplo() {
    return Container(
      height: 200,
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: CarouselSlider(
        options: CarouselOptions(autoPlay: true),
        items: footer.gallery.image.map((e) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(e.imgThumb), fit: BoxFit.fill)),
          );
        }).toList(),
      ),
    );
  }
}
