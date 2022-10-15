import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    Key? key,
    required this.size,
    required this.onTap,
    this.border,
  }) : super(key: key);

  final Size size;
  final VoidCallback onTap;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.width * .12,
      width: size.width * .3,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: border,
      ),
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.filter_list_rounded,
              color: AppColors.grey1,
            ),
            Text(
              "Filter",
              style: TextStyle(
                fontSize: size.width * .04,
                color: AppColors.grey1,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.grey1,
            ),
          ],
        ),
      ),
    );
  }
}
