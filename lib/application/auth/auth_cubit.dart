import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moments_app/application/auth/auth_state.dart';
import 'package:moments_app/domain/auth/auth_facade.dart';

import '../../domain/app_user/app_user.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authFacade) : super(const AuthState.initial());

  final AuthFacade _authFacade;

  AppUser? user;

  StreamSubscription? _streamSubscription;
  void startWatchAuthentication() {
    _streamSubscription?.cancel();
    _streamSubscription = _authFacade.watchAuthStateChanges().listen((user) {
      log("$user");
      this.user = user;
      if (user == null) {
        emit(const AuthState.unAuthenticated());
      } else {
        emit(const AuthState.authenticated());
      }
    });
  }

  Future<void> logout() async {
    return _authFacade.signOut();
  }

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();
    return super.close();
  }
}
