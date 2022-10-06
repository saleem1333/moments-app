import 'package:flutter/material.dart';

import '../config/app_text_styles.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.text,
    this.width,
    this.height,
    this.fontSize,
    this.borderRadius,
    this.shadowColor,
    required this.color,
    required this.onPressed,
    this.textColor = Colors.white,
  }) : super(key: key);

  final String text;
  final double? width;
  final double? height;
  final double? fontSize;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;
  final BorderRadiusGeometry? borderRadius;
  final Color? shadowColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ButtonStyle(
        shadowColor:
            shadowColor != null ? MaterialStateProperty.all(shadowColor) : null,
        backgroundColor: MaterialStateProperty.all(color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(10),
            side: const BorderSide(color: Colors.transparent),
          ),
        ),
        fixedSize: MaterialStateProperty.all(
          Size(
            width ?? size.width * .3,
            height ?? size.width * .11,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.styleWeight500(
          color: textColor,
          fontSize: fontSize ?? size.width * .0475,
        ),
      ),
    );
  }
}
