import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moments_app/application/auth/sign_in_form/sign_in_form_cubit.dart';
import 'package:moments_app/application/auth/sign_in_form/sign_in_form_state.dart';
import 'package:moments_app/injections.dart';

import '../../../routes.dart';

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
    return BlocListener<SignInFormCubit, SignInFormState>(
      listener: (context, state) {
        state.authFailureOrSuccess?.fold((_) {}, (r) {
          context.go(Routes.posts);
        });
      },
      child: Form(
        autovalidateMode: state.showErrors
            ? AutovalidateMode.always
            : AutovalidateMode.disabled,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  validator: (value) => context
                      .read<SignInFormCubit>()
                      .state
                      .emailAddress
                      .failureOrValue
                      .fold((f) => f.message, (_) => null),
                  onChanged: (value) =>
                      context.read<SignInFormCubit>().emailChanged(value),
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(),
                  )),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  validator: (value) => context
                      .read<SignInFormCubit>()
                      .state
                      .password
                      .failureOrValue
                      .fold((f) => f.message, (_) => null),
                  onChanged: (value) =>
                      context.read<SignInFormCubit>().passwordChanged(value),
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(),
                  )),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await context.read<SignInFormCubit>().submit();
                  },
                  child: Text("Login")),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.push("/register");
                  },
                  child: Text("Register")),
              SizedBox(
                height: 20,
              ),
              if (state.isSubmiting) LinearProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
