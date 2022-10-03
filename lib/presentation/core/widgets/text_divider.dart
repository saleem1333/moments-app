import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class TextDivider extends StatelessWidget {
  final String text;
  const TextDivider({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: AppColors.grey2,
              thickness: 0.5,
            ),
          ),
          const SizedBox(width: 15),
          Text(
            text,
            style: TextStyle(
              color: AppColors.grey2,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Divider(
              color: AppColors.grey2,
              thickness: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
