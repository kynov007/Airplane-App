part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final User_model user;
  AuthSuccess(this.user);

  @override
  // TODO: implement props
  List<Object> get props => [user];
}

class AuthFail extends AuthState {
  final String eror;
  AuthFail(this.eror);
  @override
  // TODO: implement props
  List<Object> get props => [eror];
}
