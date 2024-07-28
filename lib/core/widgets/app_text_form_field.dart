import 'package:appointment/core/theming/colors.dart';
import 'package:appointment/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isobscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
  });

  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isobscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final String? Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              vertical: 18.h,
              horizontal: 20.w,
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(
                color: ColorsManager.mainBlue,
                width: 1.3,
              ),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(
                color: ColorsManager.lighterGrey,
                width: 1.3,
              ),
            ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
        ),
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyles.font14LightGreyRegular,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: backgroundColor ?? ColorsManager.extraLightGrey,
      ),
      obscureText: isobscureText ?? false,
      style: inputTextStyle ?? TextStyles.font14DarkBlueMedium,
      validator: validator,
    );
  }
}
