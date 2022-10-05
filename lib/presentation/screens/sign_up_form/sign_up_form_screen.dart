import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/sign_up_form/sign_up_form_cubit.dart';
import '../../../application/auth/sign_up_form/sign_up_form_state.dart';
import '../../../injections.dart';

class SignUpFormScreen extends StatelessWidget {
  const SignUpFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpFormCubit>(
      create: (context) => getIt<SignUpFormCubit>(),
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
    final state = context.watch<SignUpFormCubit>().state;
    return BlocListener<SignUpFormCubit, SignUpFormState>(
      listener: (context, state) {
        state.authFailureOrSuccess?.fold(
            (f) => f.when(
                emailAlreadyInUse: () => log("Email in use"),
                usernameAlreadyInUse: () => log("Username in use"),
                weakPassword: () => log("Weak password"),
                invalidEmailAndPasswordCombination: () => log("unreachable"),
                accountDisabled: () => log("Account diseabled"),
                serverError: () => log("Server error")),
            (r) => log("success"));
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
                      .read<SignUpFormCubit>()
                      .state
                      .emailAddress
                      .failureOrValue
                      .fold((f) => f.message, (r) => null),
                  onChanged: (value) =>
                      context.read<SignUpFormCubit>().emailChanged(value),
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(),
                  )),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  validator: (value) => context
                      .read<SignUpFormCubit>()
                      .state
                      .username
                      .failureOrValue
                      .fold((f) => f.message, (r) => null),
                  onChanged: (value) =>
                      context.read<SignUpFormCubit>().usernameChanged(value),
                  decoration: InputDecoration(
                    hintText: "Username",
                    border: OutlineInputBorder(),
                  )),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  validator: (value) => context
                      .read<SignUpFormCubit>()
                      .state
                      .password
                      .failureOrValue
                      .fold((f) => f.message, (r) => null),
                  onChanged: (value) =>
                      context.read<SignUpFormCubit>().passwordChanged(value),
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(),
                  )),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  validator: (value) => context
                      .read<SignUpFormCubit>()
                      .state
                      .confirmationPassword
                      .failureOrValue
                      .fold((f) => f.message, (r) => null),
                  onChanged: (value) => context
                      .read<SignUpFormCubit>()
                      .confirmationPasswordChanged(value),
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Confirmation Password",
                    border: OutlineInputBorder(),
                  )),
              ElevatedButton(
                  onPressed: () async {
                    await context.read<SignUpFormCubit>().submit();
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
