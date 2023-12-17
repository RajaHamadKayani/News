import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextWidget1 extends StatelessWidget {
  String? text;
  TextStyle? textStyle;
   TextWidget1({super.key,this.text,this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",style: textStyle,
    );
  }
}
