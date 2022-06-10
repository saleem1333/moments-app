import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moments_app/application/auth/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial());

  void authenticated() {
    emit(const AuthState.authenticated());
  }

  void unAuthenticated() {
    emit(const AuthState.unAuthenticated());
  }
}
