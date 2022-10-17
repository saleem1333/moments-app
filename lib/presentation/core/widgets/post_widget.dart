import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moments_app/presentation/core/config/app_colors.dart';

import '../config/app_text_styles.dart';
import '../config/svg_paths.dart';
import 'tag_chip.dart';

//TODO: remove
const String _textPlaceHolder =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Velit et porttitor magna tellus a purus tincidunt arcu. Erat purus enim viverra rutrum nisi, tincidunt in velit.";

class PostWidget extends StatelessWidget {
  const PostWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final pagePadding = EdgeInsets.symmetric(
      horizontal: size.width * .04,
      vertical: size.width * .04,
    );
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: pagePadding,
          child: Column(
            children: [
              _PostHeader(size: size),
              SizedBox(height: 15),
              Text(
                _textPlaceHolder,
                style: AppTextStyles.styleWeight500(
                  fontSize: size.width * .045,
                ),
              ),
              SizedBox(height: 15),
              _TagsRow(size: size, pagePadding: pagePadding),
              _ActionRow(pagePadding: pagePadding, size: size),
            ],
          ),
        ),
        SizedBox(height: size.width * .04)
      ],
    );
  }
}

class _PostHeader extends StatelessWidget {
  const _PostHeader({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(shape: BoxShape.circle),
          width: size.width * .12,
          height: size.width * .12,
          child: SvgPicture.asset(SvgPaths.apple),
        ),
        SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Osama Rida",
              style: AppTextStyles.styleWeight600(
                fontSize: size.width * .048,
              ),
            ),
            Text(
              "@Os01Ri  .  3d ago",
              style: AppTextStyles.styleWeight400(
                fontSize: size.width * .037,
              ),
            ),
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_horiz_rounded,
            color: AppColors.grey1,
          ),
        ),
      ],
    );
  }
}

class _TagsRow extends StatelessWidget {
  const _TagsRow({
    Key? key,
    required this.size,
    required this.pagePadding,
  }) : super(key: key);

  final Size size;
  final EdgeInsets pagePadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width - pagePadding.right * 2,
      child: Wrap(
        alignment: WrapAlignment.start,
        direction: Axis.horizontal,
        textDirection: TextDirection.ltr,
        spacing: size.width * 0.025,
        children: [
          TagChip(
            size: size,
            tagTitle: "funny",
          ),
          TagChip(
            size: size,
            tagTitle: "embarrassing",
          ),
          TagChip(
            size: size,
            tagTitle: "depression",
          ),
          TagChip(
            size: size,
            tagTitle: "cringe",
          ),
        ],
      ),
    );
  }
}

class _ActionRow extends StatelessWidget {
  const _ActionRow({
    Key? key,
    required this.pagePadding,
    required this.size,
  }) : super(key: key);

  final EdgeInsets pagePadding;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0XFFF8F9FE),
              ),
              padding: pagePadding / 3,
              child: Icon(
                Icons.keyboard_arrow_up_rounded,
                color: AppColors.grey1,
              ),
            ),
            SizedBox(width: size.width * .03),
            Text(
              "435",
              style: TextStyle(
                height: 3,
                color: AppColors.grey1,
              ),
            ),
            SizedBox(width: size.width * .03),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0XFFF8F9FE),
              ),
              padding: pagePadding / 3,
              child: Icon(
                Icons.keyboard_arrow_up_rounded,
                color: AppColors.grey1,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.comment_outlined,
              color: AppColors.grey1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .01),
              child: Text(
                "15",
                style: TextStyle(
                  height: 3,
                  color: AppColors.grey1,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .01),
              child: Icon(
                Icons.share,
                color: AppColors.grey1,
              ),
            ),
            Text(
              "12",
              style: TextStyle(
                height: 3,
                color: AppColors.grey1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
