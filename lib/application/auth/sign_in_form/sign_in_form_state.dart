import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/auth/auth_failure.dart';
import '../../../domain/auth/value_objects.dart';

part 'sign_in_form_state.freezed.dart';

@freezed
class SignInFormState with _$SignInFormState {
  const factory SignInFormState(
      {required EmailAddress emailAddress,
      required Password password,
      required Either<AuthFailure, Unit>? authFailureOrSuccess,
      required bool isSubmiting,
      required bool showErrors}) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
      emailAddress: EmailAddress(''),
      password: Password(''),
      authFailureOrSuccess: null,
      isSubmiting: false,
      showErrors: false);
}
