import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moments_app/presentation/core/config/svg_paths.dart';
import 'package:moments_app/presentation/core/widgets/circular_svg_button.dart';
import 'package:moments_app/presentation/core/widgets/main_textfield.dart';

import '../../../../application/auth/sign_up_form/sign_up_form_cubit.dart';
import '../../../../injections.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/config/app_text_styles.dart';
import '../../../core/widgets/main_button.dart';
import '../../../core/widgets/text_divider.dart';

class SignUpFormScreen extends StatelessWidget {
  const SignUpFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpFormCubit>(
      create: (context) => getIt<SignUpFormCubit>(),
      child: Scaffold(
        body: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final state = context.watch<SignUpFormCubit>().state;

    return Form(
      autovalidateMode: state.showErrors
          ? AutovalidateMode.always
          : AutovalidateMode.disabled,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(size.width * .05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * .3,
                child: Padding(
                  padding: EdgeInsets.all(size.width * .025),
                  child: SvgPicture.asset(
                    SvgPaths.signup,
                  ),
                ),
              ),
              Text(
                "Sign Up",
                style: AppTextStyles.styleWeight900(
                  color: Colors.black,
                  fontSize: size.width * .075,
                ),
              ),
              SizedBox(height: size.width * .03),
              Text(
                "Username",
                style: AppTextStyles.styleWeight700(
                  fontSize: size.width * .04,
                ),
              ),
              MainTextfield(
                hint: "Enter Username",
                onChanged: (value) =>
                    context.read<SignUpFormCubit>().usernameChanged(value),
                validator: (_) => context
                    .read<SignUpFormCubit>()
                    .state
                    .username
                    .failureOrValue
                    .fold((f) => f.message, (_) => null),
              ),
              SizedBox(height: size.width * .03),
              Text(
                "Email",
                style: AppTextStyles.styleWeight700(
                  fontSize: size.width * .04,
                ),
              ),
              MainTextfield(
                hint: "Enter Email",
                onChanged: (value) =>
                    context.read<SignUpFormCubit>().emailChanged(value),
                validator: (_) => context
                    .read<SignUpFormCubit>()
                    .state
                    .emailAddress
                    .failureOrValue
                    .fold((f) => f.message, (_) => null),
              ),
              SizedBox(height: size.width * .04),
              Text(
                "Password",
                style: AppTextStyles.styleWeight700(
                  fontSize: size.width * .04,
                ),
              ),
              MainTextfield(
                hint: "Enter Password",
                isPassword: true,
                onChanged: (value) =>
                    context.read<SignUpFormCubit>().passwordChanged(value),
                validator: (_) => context
                    .read<SignUpFormCubit>()
                    .state
                    .password
                    .failureOrValue
                    .fold((f) => f.message, (_) => null),
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
                  onChanged: (value) => context
                      .read<SignUpFormCubit>()
                      .confirmationPasswordChanged(value),
                  validator: (_) => context
                      .read<SignUpFormCubit>()
                      .state
                      .confirmationPassword
                      .failureOrValue
                      .fold((f) => f.message, (_) => null)),
              SizedBox(height: size.width * .09),
              MainButton(
                text: "Sign up",
                color: AppColors.mainColor,
                width: size.width,
                onPressed: () async {
                  await context.read<SignUpFormCubit>().submit();
                },
              ),
              SizedBox(height: size.width * .06),
              TextDivider(text: "Or continue with"),
              SizedBox(height: size.width * .04),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularSvgButton(
                    size: size,
                    svgPath: SvgPaths.google,
                    onPressed: () {},
                  ),
                  CircularSvgButton(
                    size: size,
                    svgPath: SvgPaths.facebook,
                    onPressed: () {},
                  ),
                  CircularSvgButton(
                    size: size,
                    svgPath: SvgPaths.apple,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
