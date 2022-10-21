import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moments_app/presentation/core/config/app_colors.dart';
import 'package:moments_app/presentation/core/config/app_text_styles.dart';
import 'package:moments_app/presentation/core/config/global_functions.dart';
import 'package:moments_app/presentation/core/config/svg_paths.dart';
import 'package:moments_app/presentation/core/widgets/main_button.dart';
import 'package:moments_app/presentation/core/widgets/main_textfield.dart';

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
          "Create Moment",
          style: TextStyle(
            fontSize: size.width * .045,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * .3,
              child: SvgPicture.asset(
                SvgPaths.createPost,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: pagePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Moment",
                    style: AppTextStyles.styleWeight600(
                      fontSize: size.width * .04,
                    ),
                  ),
                  MainTextfield(
                    hint: "what happend?",
                    maxLines: 4,
                  ),
                  SizedBox(height: size.width * .03),
                  Text(
                    "Tags",
                    style: AppTextStyles.styleWeight600(
                      fontSize: size.width * .04,
                    ),
                  ),
                  MainTextfield(hint: ""),
                  SizedBox(height: size.width * .03),
                  Text(
                    "Category",
                    style: AppTextStyles.styleWeight600(
                      fontSize: size.width * .04,
                    ),
                  ),
                  MainTextfield(hint: "choose a category"),
                  SizedBox(height: size.width * .04),
                  MainButton(
                    text: "Publish",
                    color: AppColors.mainColor,
                    width: size.width,
                    onPressed: () {
                      GlobalUiFunctions().showMainSnackbar(
                        context: context,
                        title: "Moment Posted",
                        description: "you'll be redirected to your moment",
                        snackColor: AppColors.snackGreenColor,
                        action: InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.close,
                            color: AppColors.grey1,
                          ),
                        ),
                        leading: SvgPicture.asset(SvgPaths.successIcon),
                      );
                    },
                  ),
                  SizedBox(height: size.width * .04),
                  MainButton(
                    text: "Discard",
                    elevation: 0,
                    borderWidth: 1.5,
                    borderColor: AppColors.mainColor,
                    color: AppColors.backgroundColor,
                    textColor: AppColors.mainColor,
                    width: size.width,
                    onPressed: () {},
                  ),
                  SizedBox(height: size.width * .03),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
