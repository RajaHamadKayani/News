import 'package:flutter/material.dart';
import 'package:news_app_project_1/utils/app_style/app_styles.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  TextEditingController? controller;
  double? height;
  double? width;
  String? hintText;
  int? color;
  double? borderWidth;
  double? borderRadius;
  VoidCallback? onTap;
  Widget? suffixIcon; // Change the type to Widget
  void Function(String category)? onChanged; // Updated property

  TextFieldWidget({
    Key? key,
    this.borderWidth,
    this.color,
    this.height,
    this.width,
    this.borderRadius,
    this.suffixIcon,
    required this.controller,
    this.hintText,
    this.onTap,
    this.onChanged, // Added onChanged property
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 0.0,
      width: width ?? 0.0,
      decoration: BoxDecoration(
        border: Border.all(color: Color(color ?? 0), width: borderWidth ?? 0.0),
        borderRadius: BorderRadius.circular(borderRadius ?? 0.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20),
        child: TextFormField(
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          controller: controller,
          onChanged: onChanged, // Added onChanged property
          decoration: InputDecoration(
            suffixIcon: suffixIcon != null // Check if suffixIcon is not null
                ? GestureDetector(
                    onTap: onTap,
                    child: suffixIcon!,
                  )
                : null,
            border: InputBorder.none,
            hintText: hintText ?? "",
            
            hintStyle: AppStyles.regularBodyBlack,
          ),
        ),
      ),
    );
  }
}
