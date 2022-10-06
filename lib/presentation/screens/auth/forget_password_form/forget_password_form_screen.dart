import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../routes.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/config/app_text_styles.dart';
import '../../../core/config/svg_paths.dart';
import '../../../core/widgets/main_button.dart';
import '../../../core/widgets/main_textfield.dart';

// currently, it's only UI. logic has not been implemented yet
class ForgetPasswordFormScreen extends StatelessWidget {
  const ForgetPasswordFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _Body());
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
        child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(size.width * .05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Padding(
                padding: EdgeInsets.all(size.width * .025),
                child: SvgPicture.asset(
                  SvgPaths.resetPassword,
                ),
              ),
            ),
            Text(
              "Forgot Password?",
              style: AppTextStyles.styleWeight900(
                color: Colors.black,
                fontSize: size.width * .065,
              ),
            ),
            SizedBox(height: size.width * .02),
            Text(
              "Enter the email that is associated with your account",
              maxLines: 4,
              style: AppTextStyles.styleWeight300(
                color: Colors.black,
                fontSize: size.width * .04,
              ),
            ),
            SizedBox(height: size.width * .05),
            Text(
              "Email",
              style: AppTextStyles.styleWeight700(
                fontSize: size.width * .04,
              ),
            ),
            MainTextfield(
              hint: "example@example.com",
            ),
            SizedBox(height: size.width * .08),
            MainButton(
              text: "Submit",
              color: AppColors.mainColor,
              width: size.width,
              onPressed: () {
                context.push(Routes.resetPassword);
              },
            ),
            SizedBox(height: size.width * .06),
          ],
        ),
      ),
    ));
  }
}
