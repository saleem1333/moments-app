import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_failure.freezed.dart';

/// a union for different types of authentication errors
@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.emailAlreadyInUse() = _EmailAlreadyInUse;
  const factory AuthFailure.weakPassword() = _WeakPassword;
  const factory AuthFailure.invalidEmailAndPasswordCombination() =
      _InvalidEmailAndPasswordCombination;
  const factory AuthFailure.accountDisabled() = _AccountDisabled;
  const factory AuthFailure.serverError() = _ServerError;
}
