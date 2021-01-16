import 'package:file/file.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InforWidgetDemo extends StatefulWidget {
  @override
  _InforWidgetDemoState createState() => _InforWidgetDemoState();
}

class _InforWidgetDemoState extends State<InforWidgetDemo> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  TextEditingController _phoneController = TextEditingController();
  int maxFileSize = 5242880;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 243, 243, 1),
      body: Stack(
        children: [
          _buildHeader(),
          Container(
            height: height,
            child: ListView(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              children: [_buildContent()],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              width: width,
              child: Container(
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 36,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white),
                        width: (width - 40) / 2,
                        alignment: Alignment.center,
                        child: Text(
                          'Hủy',
                          style: TextStyle(
                              height: 1.5,
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 36,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.15),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.black),
                        width: (width - 40) / 2,
                        child: Text('Lưu thay đổi',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildHeader() {
    return Container(
      height: 250,
      width: double.infinity,
      padding: EdgeInsets.only(top: 20),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/img_blogs_1.png'),
              fit: BoxFit.cover)),
      // child:
      // InkWell(
      //   onTap: () {},
      //   child: Stack(
      //     alignment: Alignment.topRight,
      //     children: [
      //       Padding(
      //         padding: EdgeInsets.only(right: 10),
      //       ),
      //       Container(
      //         width: 6,
      //         height: 6,
      //         margin: EdgeInsets.all(0),
      //         padding: EdgeInsets.all(0),
      //         transform: Matrix4.translationValues(-12, 0, 0),
      //         decoration:
      //             BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      //       )
      //     ],
      //   ),
      // ),
    );
  }

  _buildContent() {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 180, bottom: 80),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Positioned(
              child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      transform: Matrix4.translationValues(0, -60, 0),
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 15)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                            'https://cdn4.iconfinder.com/data/icons/small-n-flat/24/user-alt-512.png'),
                        radius: 50,
                      ),
                      height: 130,
                      width: 130,
                    ),
                    Positioned(
                        bottom: 0,
                        right: 10,
                        child: Container(
                          width: 30,
                          height: 30,
                          transform: Matrix4.translationValues(0, -60, 0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white),
                          child: InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.camera_alt,
                              size: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ))
                  ],
                )
              ],
            ),
          )),
          Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel('Họ và tên'),
                            TextFormField(
                              controller: _nameController,
                              style: TextStyle(fontSize: 15, height: 0.7),
                              validator: _validateFullname,
                              decoration: InputDecoration(
                                  hintText: 'Nhập họ tên',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                  border: InputBorder.none),
                            ),
                            Divider(
                              color: Colors.black.withOpacity(0.2),
                              height: 1,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel('Email'),
                            TextFormField(
                              controller: _emailController,
                              style: TextStyle(fontSize: 15, height: 0.7),
                              validator: _validateEmail,
                              decoration: InputDecoration(
                                  hintText: 'Nhập email',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                  border: InputBorder.none),
                            ),
                            Divider(
                              color: Colors.black.withOpacity(0.2),
                              height: 1,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel('Số điện thoại'),
                            TextFormField(
                              controller: _phoneController,
                              style: TextStyle(fontSize: 15, height: 0.7),
                              validator: _validatePhoneNumber,
                              decoration: InputDecoration(
                                  hintText: 'Nhập số điện thoại',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                  border: InputBorder.none),
                            ),
                            Divider(
                              color: Colors.black.withOpacity(0.2),
                              height: 1,
                            )
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }

  _buildLabel(title) {
    return Text(
      title,
      style: TextStyle(fontSize: 13, color: Colors.black),
    );
  }

  get _validateFullname => (value) {
        if (value.isEmpty || value.trim().length < 1) {
          return 'Vui lòng nhập tên của bạn';
        }
        return null;
      };
  get _validateEmail => (value) {
        if (value.isEmpty) {
          return 'Vui lòng nhập email của bạn';
        }
        // else if (!Utilities.validEmail(value)) {
        //   return 'Email không hợp lệ';
        // }
        return null;
      };
  get _validatePhoneNumber => (value) {
        if (value == null || value.isEmpty) {
          return 'Vui lòng nhập số điện thoại của bạn';
        }
        //  else if (!Utilities.validPhoneNumber(value ?? "")) {
        //   return CoreData.textPhoneWrongFormat;
        // }
        return null;
      };
}
