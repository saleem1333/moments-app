import 'package:go_router/go_router.dart';

import '../presentation/screens/posts/post_form_screen.dart';
import '../presentation/screens/posts/posts_screen.dart';
import '../presentation/screens/sign_in_form/sign_in_form_screen.dart';
import '../presentation/screens/sign_up_form/sign_up_form_screen.dart';
import '../presentation/screens/splash/splash_screen.dart';

final GoRouter router =
    GoRouter(initialLocation: Routes.splash, routes: <GoRoute>[
  GoRoute(path: Routes.splash, builder: (_, __) => const SplashScreen()),
  GoRoute(path: Routes.posts, builder: (_, __) => const PostsScreen()),
  GoRoute(path: Routes.signIn, builder: (_, __) => const SignInFormScreen()),
  GoRoute(path: Routes.signup, builder: (_, __) => const SignUpFormScreen()),
  GoRoute(path: Routes.postForm, builder: (_, __) => const PostFormScreen())
]);

class Routes {
  static String splash = "/";
  static String signIn = "/login";
  static String signup = "/register";
  static String posts = "/posts";
  static String postForm = "$posts/create";

  // to prevent making Routes instances
  const Routes._();
}
