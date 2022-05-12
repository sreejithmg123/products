import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:products/utils/textStyles.dart';

import 'colors.dart';

class CustomContainer extends StatelessWidget {
  Widget? child;
  Color? color;
  double? height;
  double? width;
  double? borderRadius;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;
  Alignment alignment;
  Widget? leading;
  var onTap;
  CustomContainer(
      {this.child,
      this.color,
      this.height,
      this.width,
      this.borderRadius = 30,
      this.margin,
      this.padding,
      this.alignment = Alignment.center,
      this.onTap,
      this.leading});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: alignment,
        margin: margin,
        padding: padding,
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
            color: color),
        child: child,
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  CustomText? label;
  String? hintText;
  TextStyle? hintStyle;
  FloatingLabelBehavior floatingLabelBehavior = FloatingLabelBehavior.always;
  Color borderColor = AppColors.lightGrey;
  double borderRadius = 10;
  TextEditingController controller;
  TextInputType? keyBoardType;
  var onChanged;
  var onSaved;
  var validator;
  bool obSecureText = false;
  int? maxLength;
  CustomTextFormField(
      {this.label,
      this.hintText,
      this.hintStyle,
      this.floatingLabelBehavior = FloatingLabelBehavior.never,
      this.borderColor = AppColors.lightGrey,
      this.borderRadius = 10,
      required this.controller,
      this.onChanged,
      this.onSaved,
      this.validator,
      this.obSecureText = false,
      this.maxLength,
      this.keyBoardType});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyBoardType,
      maxLength: maxLength,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      onChanged: onChanged,
      onSaved: onSaved,
      obscureText: obSecureText,
      style: AppTextStyles.regular.copyWith(color: AppColors.black),
      decoration: InputDecoration(
          label: label,
          hintStyle: hintStyle,
          focusColor: AppColors.grey,
          focusedBorder: border(),
          errorBorder: border(),
          enabledBorder: border(),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(borderRadius))),
    );
  }

  static OutlineInputBorder border() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.grey, width: .5),
      borderRadius: BorderRadius.circular(10),
    );
  }
}

class CustomText extends StatelessWidget {
  String? text;
  TextStyle? style;
  TextAlign textAlign = TextAlign.center;
  CustomText({this.text, this.style, this.textAlign = TextAlign.center});
  @override
  Widget build(BuildContext context) {
    return Text(text ?? '', style: style, textAlign: textAlign);
  }
}
