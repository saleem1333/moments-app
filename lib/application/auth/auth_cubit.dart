import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moments_app/application/auth/auth_state.dart';
import 'package:moments_app/domain/auth/auth_facade.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authFacade) : super(const AuthState.initial());

  final AuthFacade _authFacade;

  StreamSubscription? _streamSubscription;
  void startWatchAuthentication() {
    _streamSubscription?.cancel();
    _streamSubscription = _authFacade.watchAuthStateChanges().listen((user) {
      if (user == null) {
        emit(const AuthState.unAuthenticated());
      } else {
        emit(const AuthState.authenticated());
      }
    });
  }

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();
    return super.close();
  }
}
