import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:moments_app/application/auth/sign_in_form/sign_in_form_cubit.dart';
import 'package:moments_app/injections.dart';
import 'package:moments_app/presentation/core/config/svg_paths.dart';
import 'package:moments_app/presentation/core/widgets/circular_svg_button.dart';
import 'package:moments_app/presentation/core/widgets/main_textfield.dart';
import 'package:moments_app/presentation/core/widgets/text_divider.dart';
import 'package:moments_app/routes.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/config/app_text_styles.dart';
import '../../../core/widgets/main_button.dart';

class SignInFormScreen extends StatelessWidget {
  const SignInFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInFormCubit>(
      create: (context) => getIt<SignInFormCubit>(),
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SignInFormCubit>().state;
    final size = MediaQuery.of(context).size;
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
              Padding(
                padding: EdgeInsets.all(size.width * .025),
                child: SvgPicture.asset(SvgPaths.welcome),
              ),
              Text(
                "Log In",
                style: AppTextStyles.styleWeight900(
                  color: Colors.black,
                  fontSize: size.width * .075,
                ),
              ),
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
              SizedBox(height: size.width * .06),
              TextDivider(text: "Or continue with"),
              SizedBox(height: size.width * .06),
              Text(
                "Email",
                style: AppTextStyles.styleWeight700(
                  fontSize: size.width * .04,
                ),
              ),
              MainTextfield(
                hint: "example@example.com",
                onChanged: (value) =>
                    context.read<SignInFormCubit>().emailChanged(value),
                validator: (_) => context
                    .read<SignInFormCubit>()
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
                  hint: "************",
                  isPassword: true,
                  onChanged: (value) =>
                      context.read<SignInFormCubit>().passwordChanged(value),
                  validator: (_) => context
                      .read<SignInFormCubit>()
                      .state
                      .password
                      .failureOrValue
                      .fold((f) => f.message, (_) => null)),
              SizedBox(height: size.width * .02),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Forgot Password?",
                    style: AppTextStyles.styleWeight700(
                      color: AppColors.mainColor,
                      fontSize: size.width * .035,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                    activeColor: AppColors.mainColor,
                  ),
                  Text(
                    "Remeber me",
                    style: TextStyle(
                      fontSize: size.width * .038,
                    ),
                  ),
                ],
              ),
              MainButton(
                text: "Sign In",
                color: AppColors.mainColor,
                width: size.width,
                onPressed: () async {
                  await context.read<SignInFormCubit>().submit();
                },
              ),
              SizedBox(height: size.width * .08),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account? ",
                    style: AppTextStyles.styleWeight500(
                      fontSize: size.width * .035,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.push(Routes.signup);
                    },
                    child: Text(
                      "Sign up",
                      style: AppTextStyles.styleWeight700(
                        color: AppColors.mainColor,
                        fontSize: size.width * .035,
                      ),
                    ),
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
