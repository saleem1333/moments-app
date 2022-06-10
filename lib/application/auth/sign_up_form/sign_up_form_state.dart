import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moments_app/domain/auth/value_objects.dart';

import '../../../domain/app_user/value_objects.dart';
import '../../../domain/auth/auth_failure.dart';

part 'sign_up_form_state.freezed.dart';

@freezed
class SignUpFormState with _$SignUpFormState {
  const factory SignUpFormState(
          {required EmailAddress emailAddress,
          required Username username,
          required Password password,
          required bool isSubmiting,
          required bool showErrors,
          required Either<AuthFailure, Unit>? authFailureOrSuccess}) =
      _SignUpFormState;

  factory SignUpFormState.initial() => SignUpFormState(
      emailAddress: EmailAddress(''),
      username: Username(''),
      password: Password(''),
      isSubmiting: false,
      showErrors: false,
      authFailureOrSuccess: null);
}
