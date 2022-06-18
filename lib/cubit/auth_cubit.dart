import 'package:airplane/models/User_model.dart';
import 'package:airplane/services/auth_service.dart';
import 'package:airplane/services/user_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signIn({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      User_model user = await AuthService().signIn(
        email: email,
        password: password,
      );
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFail(e.toString()));
    }
  }

  void signUp({
    required String email,
    required String password,
    required String name,
    String hobby = '',
  }) async {
    try {
      emit(AuthLoading());

      User_model user = await AuthService()
          .signUp(email: email, password: password, name: name, hobby: hobby);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFail(e.toString()));
    }
  }

  void singOut() async {
    try {
      emit(AuthLoading());
      await AuthService().signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFail(e.toString()));
    }
  }

  void getCurretUser(String id) async {
    try {
      User_model user = await UserService().getUserById(id);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFail(e.toString()));
    }
  }
}
