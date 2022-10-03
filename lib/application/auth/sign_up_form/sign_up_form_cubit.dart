import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moments_app/application/auth/sign_up_form/sign_up_form_state.dart';
import 'package:moments_app/domain/app_user/app_user.dart';
import 'package:moments_app/domain/app_user/app_user_repository.dart';
import 'package:moments_app/domain/auth/value_objects.dart';
import 'package:moments_app/domain/core/id_generator.dart';

import '../../../domain/app_user/value_objects.dart';
import '../../../domain/auth/auth_failure.dart';

class SignUpFormCubit extends Cubit<SignUpFormState> {
  SignUpFormCubit(this._appUserRepository) : super(SignUpFormState.initial());

  final AppUserRepository _appUserRepository;

  void emailChanged(String emailStr) {
    emit(state.copyWith(emailAddress: EmailAddress(emailStr)));
  }

  void usernameChanged(String usernameStr) {
    emit(state.copyWith(username: Username(usernameStr)));
  }

  void passwordChanged(String passwordStr) {
    emit(state.copyWith(password: Password(passwordStr)));
  }

  void userProfileImageChanged(Uint8List bytes) {
    emit(state.copyWith(userProfileImage: UserProfileImage(bytes)));
  }

  Future<void> submit() async {
    if (state.emailAddress.isValid() &&
        state.username.isValid() &&
        state.password.isValid() &&
        (state.userProfileImage == null || state.userProfileImage!.isValid())) {
      emit(state.copyWith(
          authFailureOrSuccess: null, isSubmiting: true, showErrors: false));

      final Either<AuthFailure, Unit> failureOrSuccess =
          await _appUserRepository.createUser(AppUser(
              id: generateId(),
              username: state.username,
              emailAddress: state.emailAddress,
              password: state.password,
              userProfileImage: state.userProfileImage));

      emit(state.copyWith(
          isSubmiting: false, authFailureOrSuccess: failureOrSuccess));
    } else {
      emit(state.copyWith(showErrors: true));
    }
  }
}
