import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moments_app/presentation/core/config/global_functions.dart';

import '../../../application/auth/auth_cubit.dart';
import '../../../application/auth/auth_state.dart';
import '../../../routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.when(
            initial: () {},
            authenticated: () => context.go(Routes.home),
            unAuthenticated: () => context.go(Routes.signIn));
      },
      child: Scaffold(
        body: Center(child: GlobalUiFunctions.loading()),
      ),
    );
  }
}
