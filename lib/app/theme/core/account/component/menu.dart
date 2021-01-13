import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:suplo_project_8_12_2020/app/theme/core/wishlist/wishlist.widget.dart';
import 'package:suplo_project_8_12_2020/custom_icons_icons.dart';

class MenuAccount extends StatefulWidget {
  @override
  _MenuAccountState createState() => _MenuAccountState();
}

class _MenuAccountState extends State<MenuAccount> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      margin: EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        padding: EdgeInsets.only(top: 15),
        child: Column(children: [
          _buildItem(
              MdiIcons.clipboardListOutline, 'Đơn hàng của tôi', Container()),
          _buildDivider(),
          _buildItem(Icons.favorite, 'Sản phẩm yêu thích', WishlistWidget()),
          _buildDivider(),
          _buildItem(MdiIcons.clock, 'Đã xem', Container()),
          _buildDivider(),
          _buildItem(MdiIcons.ticketPercent, 'Ví voucher', Container()),
          _buildDivider(),
          _buildItem(
              MdiIcons.helpCircleOutline, 'Trung tâm hỗ trợ', Container()),
        ]),
      ),
    );
  }

  _buildItem(IconData icon, String name, Widget screen) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => screen));
      },
      child: Container(
        height: 30,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 15, left: 20),
                  child: Icon(
                    icon,
                    size: 16,
                    color: Colors.black,
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildDivider() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Divider(height: 1.0, color: Colors.black.withOpacity(.3)),
    );
  }
}
