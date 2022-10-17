import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moments_app/presentation/core/config/app_colors.dart';

import '../../../domain/posts/post.dart';
import '../config/app_text_styles.dart';
import '../config/svg_paths.dart';
import 'tag_chip.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostWidget extends StatelessWidget {
  const PostWidget({
    Key? key,
    required this.post,
    required this.size,
  }) : super(key: key);

  final Post post;
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
              _PostHeader(size: size, post: post),
              SizedBox(height: 15),
              Text(
                post.content.getOrCrash(),
                style: AppTextStyles.styleWeight500(
                  fontSize: size.width * .045,
                ),
              ),
              _TagsRow(size: size, pagePadding: pagePadding, tags: post.tags),
              _ActionRow(
                pagePadding: pagePadding,
                size: size,
                votes: post.votes,
                comments: post.comments,
              ),
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
    required this.post,
    required this.size,
  }) : super(key: key);
  final Size size;
  final Post post;

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
              post.appUser!.username.getOrCrash(),
              style: AppTextStyles.styleWeight600(
                fontSize: size.width * .048,
              ),
            ),
            Text(
              "@${post.appUser!.username.getOrCrash()}  .  ${timeago.format(post.createdAt!)}",
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
  const _TagsRow(
      {Key? key,
      required this.size,
      required this.pagePadding,
      required this.tags})
      : super(key: key);

  final EdgeInsets pagePadding;
  final Size size;
  final PostTags tags;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width - pagePadding.right * 2,
      child: Wrap(
          alignment: WrapAlignment.start,
          direction: Axis.horizontal,
          textDirection: TextDirection.ltr,
          spacing: size.width * 0.025,
          children: tags
              .getOrCrash()
              .map(
                  (tag) => TagChip(size: size, tagTitle: tag.name.getOrCrash()))
              .toList()),
    );
  }
}

class _ActionRow extends StatelessWidget {
  const _ActionRow(
      {Key? key,
      required this.pagePadding,
      required this.size,
      required this.votes,
      required this.comments})
      : super(key: key);

  final EdgeInsets pagePadding;
  final Size size;
  final PostVotes votes;
  final PostComments comments;

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
              votes.getOrCrash().length.toString(),
              style: TextStyle(height: 3),
            ),
            SizedBox(width: size.width * .03),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0XFFF8F9FE),
              ),
              padding: pagePadding / 3,
              child: Icon(
                Icons.keyboard_arrow_down_rounded,
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
                comments.getOrCrash().length.toString(),
                style: TextStyle(height: 3),
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
