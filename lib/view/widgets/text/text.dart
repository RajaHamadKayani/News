import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextWidget extends StatelessWidget {
  String? title;
  int? color;
  double? fontSize;
  FontWeight? fontWeight;
  TextWidget(
      {super.key, this.color, this.fontSize, this.fontWeight, this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? "",
      style: TextStyle(
          color: Color(color ?? 0),
          fontSize: fontSize ?? 0.0,
          fontWeight: fontWeight),
    );
  }
}
