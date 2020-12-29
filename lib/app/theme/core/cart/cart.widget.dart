import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:suplo_project_8_12_2020/app/theme/core/cart/components/note.dart';

class CartWidget extends StatefulWidget {
  @override
  _CartWidgetState createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  GlobalConfiguration configs = GlobalConfiguration();
  @override
  Widget build(BuildContext context) {
    double widthDevice = configs.get("widthDevice");
    double heightDevice = configs.get("heightDevice");
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 243, 243, 1),
      appBar: AppBar(
        brightness: Brightness.light,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Container(
          width: 50,
          height: 35,
          alignment: Alignment.center,
          child: FlatButton(
              padding: EdgeInsets.only(left: 10, right: 15),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, color: Colors.black)),
        ),
        titleSpacing: 0,
        title: Text('Giỏ hàng của tôi',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
      ),
      body: Stack(
        children: [
          buildEmptyCart(),
          /*buildCartBottom(widthDevice)*/
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [buildCartBottom(widthDevice)],
          )
        ],
      ),
    );
  }

  Widget buildEmptyCart() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: MediaQuery.of(context).size.height - 250,
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: Image.asset('assets/images/cart_empty.png',
                  alignment: Alignment.center, fit: BoxFit.contain),
            ),
            Text('Chưa có sản phẩm nào.',
                style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: Colors.black))
          ],
        ),
      ),
    );
  }

  Widget buildCartBottom(double widthDevice) {
    return Positioned(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFF333333).withOpacity(.2)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  child: RichText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 14),
                        children: [
                          WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Icon(MdiIcons.noteTextOutline,
                                  color: Colors.grey, size: 18)),
                          WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text('Ghi chú',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black)),
                              ))
                        ]),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return NotePage();
                    }));
                  },
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFF333333).withOpacity(.2)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('0',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18)),
                    SizedBox(
                      width: 5,
                    ),
                    Text('sản phẩm',
                        style: TextStyle(fontSize: 14, height: 1.2))
                  ],
                ),
                Text('Tạm tính:', style: TextStyle(fontSize: 14, height: 1.2)),
                Text(
                  '0đ',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                )
              ],
            ),
          ),
          InkWell(
              onTap: () {},
              child: Container(
                width: 345,
                margin: EdgeInsets.symmetric(vertical: 15),
                padding: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: (Colors.black.withOpacity(0.8)),
                ),
                child: Text('Tiến hành đặt hàng',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700)),
              ))
        ],
      ),
    ));
  }
}
