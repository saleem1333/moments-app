import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:moments_app/application/auth/auth_cubit.dart';
import 'package:moments_app/application/auth/sign_in_form/sign_in_form_cubit.dart';
import 'package:moments_app/application/auth/sign_up_form/sign_up_form_cubit.dart';
import 'package:moments_app/application/category/category_watcher_cubit.dart';
import 'package:moments_app/application/posts/post_form/post_form_cubit.dart';
import 'package:moments_app/application/posts/post_watcher/post_watcher_cubit.dart';
import 'package:moments_app/domain/app_user/app_user_repository.dart';
import 'package:moments_app/domain/auth/auth_facade.dart';
import 'package:moments_app/domain/category/category_repository.dart';
import 'package:moments_app/domain/posts/posts_repository.dart';
import 'package:moments_app/infrastructure/app_user/app_user_repository_impl.dart';
import 'package:moments_app/infrastructure/auth/auth_facade_impl.dart';
import 'package:moments_app/infrastructure/posts/posts_repository_impl.dart';

import 'infrastructure/category/category_repository_impl.dart';

final getIt = GetIt.instance;

void registerInjections() {
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<AuthFacade>(
      AuthFacadeImpl(getIt<FirebaseAuth>(), getIt<FirebaseFirestore>()));
  getIt.registerSingleton<AuthCubit>(AuthCubit(getIt<AuthFacade>()));

  getIt.registerSingleton<AppUserRepository>(
      AppUserRepositoryImpl(getIt<FirebaseFirestore>(), getIt<FirebaseAuth>()));

  getIt.registerSingleton<CategoryRepository>(
      CategoryRepositoryImpl(getIt<FirebaseFirestore>()));
  getIt.registerSingleton<PostsRepository>(PostsRepositoryImpl(
      getIt<FirebaseFirestore>(),
      getIt<AppUserRepository>(),
      getIt<CategoryRepository>()));

  getIt.registerFactory<SignInFormCubit>(
      () => SignInFormCubit(getIt<AuthFacade>()));

  getIt.registerFactory<SignUpFormCubit>(
      () => SignUpFormCubit(getIt<AppUserRepository>()));

  getIt.registerFactory<PostWatcherCubit>(
      () => PostWatcherCubit(getIt<PostsRepository>()));

  getIt.registerFactory<PostFormCubit>(
      () => PostFormCubit(getIt<PostsRepository>()));

  getIt.registerFactory<CategoryWatcherCubit>(
      () => CategoryWatcherCubit(getIt<CategoryRepository>()));
}
