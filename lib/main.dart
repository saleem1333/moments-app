import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moments_app/application/auth/auth_cubit.dart';
import 'package:moments_app/injections.dart';
import 'package:moments_app/presentation/screens/posts/posts_screen.dart';
import 'package:moments_app/presentation/screens/posts/post_form_screen.dart';
import 'package:moments_app/presentation/screens/sign_in_form/sign_in_form_screen.dart';
import 'package:moments_app/presentation/screens/sign_up_form/sign_up_form_screen.dart';
import 'package:moments_app/presentation/screens/splash/splash_screen.dart';

final GoRouter _router = GoRouter(initialLocation: "/posts", routes: <GoRoute>[
  GoRoute(path: "/", builder: (_, __) => const SplashScreen()),
  GoRoute(path: "/posts", builder: (_, __) => const PostsScreen()),
  GoRoute(path: "/login", builder: (_, __) => const SignInFormScreen()),
  GoRoute(path: "/register", builder: (_, __) => const SignUpFormScreen()),
  GoRoute(path: "/posts/create", builder: (_, __) => const PostFormScreen())
]);
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  registerInjections();

  runApp(BlocProvider<AuthCubit>(
    create: (context) => getIt<AuthCubit>()..startWatchAuthentication(),
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      routerDelegate: _router.routerDelegate,
    );
  }
}
