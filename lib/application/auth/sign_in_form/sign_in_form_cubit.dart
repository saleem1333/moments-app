import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moments_app/application/auth/sign_in_form/sign_in_form_state.dart';
import 'package:moments_app/domain/auth/auth_facade.dart';
import 'package:moments_app/domain/auth/value_objects.dart';

import '../../../domain/auth/auth_failure.dart';

class SignInFormCubit extends Cubit<SignInFormState> {
  SignInFormCubit(this._authFacade) : super(SignInFormState.initial());

  final AuthFacade _authFacade;

  void emailChanged(String emailStr) {
    emit(state.copyWith(emailAddress: EmailAddress(emailStr)));
  }

  void passwordChanged(String passwordStr) {
    emit(state.copyWith(password: Password(passwordStr)));
  }

  Future<void> submit() async {
    if (state.emailAddress.isValid() && state.password.isValid()) {
      emit(state.copyWith(
          authFailureOrSuccess: null, isSubmiting: true, showErrors: false));
      final Either<AuthFailure, Unit> failureOrSuccess =
          await _authFacade.loginWithEmailAndPassword(
              email: state.emailAddress.getOrCrash(),
              password: state.password.getOrCrash());

      emit(state.copyWith(
          isSubmiting: false, authFailureOrSuccess: failureOrSuccess));
    } else {
      emit(state.copyWith(showErrors: true));
    }
  }
}
