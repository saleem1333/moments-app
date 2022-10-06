import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moments_app/presentation/core/config/svg_paths.dart';
import 'package:moments_app/presentation/core/widgets/main_textfield.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/config/app_text_styles.dart';
import '../../../core/widgets/main_button.dart';

// currently, it's only UI. logic has not been implemented yet

class ResetPasswordFormScreen extends StatelessWidget {
  const ResetPasswordFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Body(),
    );
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
                "Reset Password",
                style: AppTextStyles.styleWeight900(
                  color: Colors.black,
                  fontSize: size.width * .065,
                ),
              ),
              SizedBox(height: size.width * .05),
              Text(
                "New Password",
                style: AppTextStyles.styleWeight700(
                  fontSize: size.width * .04,
                ),
              ),
              MainTextfield(
                hint: "Enter New Password",
                isPassword: true,
              ),
              SizedBox(height: size.width * .02),
              Text(
                "Must be at least 8 characters",
                style: AppTextStyles.styleWeight400(
                  fontSize: size.width * .032,
                ),
              ),
              SizedBox(height: size.width * .04),
              Text(
                "Confirm Password",
                style: AppTextStyles.styleWeight700(
                  fontSize: size.width * .04,
                ),
              ),
              MainTextfield(
                hint: "Enter Confirm Password",
                isPassword: true,
              ),
              SizedBox(height: size.width * .02),
              Text(
                "Both password must match",
                style: AppTextStyles.styleWeight400(
                  fontSize: size.width * .032,
                ),
              ),
              SizedBox(height: size.width * .08),
              MainButton(
                text: "Reset Password",
                color: AppColors.mainColor,
                width: size.width,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
