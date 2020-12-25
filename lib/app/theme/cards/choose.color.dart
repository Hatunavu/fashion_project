import 'package:flutter/material.dart';
import 'package:suplo_project_8_12_2020/custom_icons_icons.dart';

class ChooseColor extends StatefulWidget {
  String color;
  bool hasPressed;
  ChooseColor({this.color, this.hasPressed});

  @override
  _ChooseColorState createState() => _ChooseColorState();
}

class _ChooseColorState extends State<ChooseColor> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              widget.hasPressed = !widget.hasPressed;
            });
          },
          child: SizedBox(
              height: 35,
              width: 35,
              child: Wrap(
                children: [
                  Text('${widget.color}'),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: widget.hasPressed
                                  ? Colors.black
                                  : Colors.transparent),
                          //color: widget.color,
                          borderRadius: BorderRadius.circular(20)),
                      child: widget.hasPressed
                          ? Icon(
                              CustomIcons.icon_check,
                              size: 18,
                            )
                          : null),
                ],
              )),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
