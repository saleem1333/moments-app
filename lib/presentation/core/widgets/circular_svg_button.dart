import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircularSvgButton extends StatelessWidget {
  const CircularSvgButton(
      {Key? key,
      required this.size,
      required this.svgPath,
      required this.onPressed})
      : super(key: key);

  final Size size;
  final String svgPath;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * .16,
      height: size.width * .16,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.all(size.width * .022),
            child: SvgPicture.asset(svgPath),
          ),
        ),
      ),
    );
  }
}
