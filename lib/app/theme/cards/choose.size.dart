import 'package:flutter/material.dart';

class ChooseSize extends StatefulWidget {
  String size;
  bool hasCheck;
  ChooseSize({this.size, this.hasCheck});

  @override
  _ChooseSizeState createState() => _ChooseSizeState(size, hasCheck);
}

class _ChooseSizeState extends State<ChooseSize> {
  String size;

  _ChooseSizeState(this.size, this._checkSize);

  bool _checkSize = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _checkSize = !_checkSize;
            });
          },
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              border: Border.all(
                  color: _checkSize ? Colors.black : Colors.grey[300]),
            ),
            child: Container(
              child: Center(
                child: Text(
                  '${widget.size}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
