import 'package:flutter/material.dart';

import '../config/app_text_styles.dart';

class MainTextfield extends StatelessWidget {
  const MainTextfield({
    Key? key,
    this.borderColor,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.enabled = true,
    this.error = false,
    this.smallSuffixIcon = false,
    this.borderRadius,
    this.maxLines = 1,
    this.hintColor,
    this.width,
    this.height,
    this.controller,
    this.fillColor = Colors.white,
    required this.hint,
  }) : super(key: key);

  final Color? borderColor;
  final double? width;
  final double? height;
  final String hint;
  final Color? hintColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool enabled;
  final bool smallSuffixIcon;
  final bool error;
  final int maxLines;
  final BorderRadius? borderRadius;
  final Color fillColor;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        controller: controller,
        validator: validator,
        cursorColor: borderColor ?? Theme.of(context).primaryColor,
        enabled: enabled,
        keyboardType: keyboardType,
        maxLines: maxLines,
        onChanged: onChanged,
        decoration: InputDecoration(
          constraints: BoxConstraints(maxWidth: size.width),
          filled: true,
          fillColor: fillColor,
          hintText: hint,
          hintStyle: AppTextStyles.styleWeight500(
            fontSize: size.width * .035,
            color: hintColor ?? Colors.grey.shade600,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
            borderSide: BorderSide(
              color:
                  error ? Theme.of(context).errorColor : Colors.grey.shade300,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
            borderSide: BorderSide(
                color: borderColor ?? Theme.of(context).primaryColor),
          ),
          border: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          prefixIcon: prefixIcon,
          prefixIconConstraints: smallSuffixIcon
              ? BoxConstraints(maxWidth: size.width * .15)
              : null,
          suffixIcon: suffixIcon,
          suffixIconConstraints: smallSuffixIcon
              ? BoxConstraints(maxWidth: size.width * .15)
              : null,
          contentPadding: maxLines != 1
              ? null
              : const EdgeInsets.symmetric(horizontal: 16.0),
        ),
        obscureText: isPassword,
        enableSuggestions: isPassword,
        autocorrect: isPassword,
      ),
    );
  }
}
