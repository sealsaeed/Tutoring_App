import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutoring_app/app/modules/auth/domain/provider/state/auth_state.dart';
import 'package:tutoring_app/app/modules/auth/domain/repo/auth_repo.dart';

class AuthController extends StateNotifier<AuthState> {
  AuthController(super.state, this._authRepo);
  final AuthRepo _authRepo;

  Future<bool> register(
      {required String email,
      required String username,
      required String password}) async {
    state = state.copyWith(isLoading: true);
    try {
      User? user = await _authRepo.createUserWithEmailAndPassword(
          email: email, password: password, userName: username);
      if (user != null) {
        await user.updateDisplayName(username);
        state = state.copyWith(isLoading: false, isAuth: true);
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  Future googleSign() async {
    state = state.copyWith(isLoading: true);
    try {
      final user = _authRepo.signInWithGoogle();
      if (user != null) {
        state = state.copyWith(isAuth: true);
      }
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      throw e.toString();
    }
  }

  Future<void> signOut() async {
    try {
      await _authRepo.signOut();
    } catch (e) {
      throw e.toString();
    }
  }
}
