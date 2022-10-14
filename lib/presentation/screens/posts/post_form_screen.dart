import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moments_app/presentation/core/config/app_colors.dart';
import 'package:moments_app/presentation/core/config/app_text_styles.dart';
import 'package:moments_app/presentation/core/config/svg_paths.dart';
import 'package:moments_app/presentation/core/widgets/post_widget.dart';
import 'package:moments_app/presentation/screens/posts/widgets/filter_button.dart';

class PostFormScreen extends StatelessWidget {
  const PostFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pagePadding = EdgeInsets.symmetric(
      horizontal: size.width * .04,
      vertical: size.width * .04,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Post",
          style: TextStyle(
            fontSize: size.width * .055,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.darkBlue,
            ),
            onPressed: () {},
          ),
        ],
        leading: Container(
          margin: pagePadding,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(SvgPaths.google),
        ),
      ),
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          PostWidget(size: size),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: size.height * .03,
              horizontal: size.width * .06,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FilterButton(size: size, onTap: () {}),
                SizedBox(height: size.height * .025),
                _CommentTextField(size: size),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CommentTextField extends StatelessWidget {
  const _CommentTextField({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          cursorHeight: size.height * 0.03,
          decoration: InputDecoration(
            constraints: BoxConstraints(maxWidth: size.width),
            filled: true,
            fillColor: Colors.white,
            hintText: "Add Comment",
            hintStyle: AppTextStyles.styleWeight500(
              fontSize: size.width * .04,
              color: AppColors.grey1,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            prefixIcon: Container(
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: SvgPicture.asset(
                SvgPaths.google,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
