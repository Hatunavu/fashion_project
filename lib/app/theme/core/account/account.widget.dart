import 'package:flutter/material.dart';
import 'package:suplo_project_8_12_2020/app/theme/core/account/component/header.dart';
import 'package:suplo_project_8_12_2020/app/theme/core/account/component/menu.dart';

class AccountWidget extends StatefulWidget {
  @override
  _AccountWidgetState createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 243, 243, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderAccount(),
            MenuAccount(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: InkWell(
                onTap: () {
                  _onLogoutClick(context);
                },
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  height: 36,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.black),
                  child: Text(
                    'Đăng xuất',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1.5,
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onLogoutClick(context) {
    showDialog(
        context: context,
        // barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text('Đăng xuất'),
            content: Text('Bạn có chắc muốn đăng xuất không?'),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Hủy')),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Xác nhận'))
            ],
          );
        });
  }
}
