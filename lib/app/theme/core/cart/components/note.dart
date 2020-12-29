import 'package:flutter/material.dart';

class NotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        title: Text('Ghi chú',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
              ),
              child: TextField(
                autocorrect: false,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
                maxLines: 8,
                decoration: InputDecoration(
                    hintText: 'Nhập ghi chú của bạn (Tối đa 4000 ký tự)',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.grey),
                    border: InputBorder.none),
              ),
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: FlatButton(
                      child: Text('Hủy',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(width: 1, color: Colors.black)),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    child: FlatButton(
                      child: Text('Lưu',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
