import 'package:flutter/material.dart';
import 'package:moments_app/presentation/core/config/app_colors.dart';
import 'package:moments_app/presentation/core/config/app_text_styles.dart';

class TagChip extends StatelessWidget {
  const TagChip({
    Key? key,
    required this.size,
    required this.tagTitle,
  }) : super(key: key);

  final Size size;
  final String tagTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: size.width * .025),
      decoration: BoxDecoration(
        color: AppColors.lightBlue,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      child: Text(
        tagTitle.toUpperCase(),
        style: AppTextStyles.styleWeight600(
          color: AppColors.darkBlue,
          fontSize: size.width * .033,
        ),
      ),
    );
  }
}
