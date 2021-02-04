import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:suplo_project_8_12_2020/app/theme/core/profile/profile.widget.dart';

class HeaderAccount extends StatefulWidget {
  String name;
  String phone;
  HeaderAccount({this.name, this.phone});
  @override
  _HeaderAccountState createState() => _HeaderAccountState();
}

class _HeaderAccountState extends State<HeaderAccount> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'assets/images/img_blogs_1.png',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 140),
          child: buildHeader(),
        )
      ],
    );
  }

  Widget buildHeader() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      // height: 250,
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Stack(
            overflow: Overflow.visible,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 100,
                  ),
                  Expanded(
                      child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileWidget()));
                    },
                    padding: EdgeInsets.only(
                        left: 20, right: 15, top: 15, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget?.name ?? '',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              widget?.phone ?? '',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(.7),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        )),
                        Icon(
                          Icons.arrow_right_rounded,
                          size: 40,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ))
                ],
              ),
              Positioned(
                  top: -30,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 4),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 10)
                        ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/images/user.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildItem(Icons.loyalty, 'Tích lũy', '0'),
                        Divider(
                          color: Colors.black.withOpacity(0.2),
                          height: 1,
                        ),
                        _buildItem(
                            Icons.star, 'Hạng thành viên', 'Chưa xếp hạng')
                      ]),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      border: Border(
                    left: BorderSide(
                        color: Colors.black.withOpacity(0.1), width: 1),
                  )),
                  alignment: Alignment.center,
                  child: QrImage(
                    data: 'https://www.facebook.com/hatunavu',
                    size: (width * 0.5) - 60,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildItem(IconData icon, String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: Colors.black,
                size: 18,
              ),
              SizedBox(
                width: 5,
              ),
              Text(label)
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            value,
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
