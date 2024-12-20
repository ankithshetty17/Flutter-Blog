part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState{}

final class AuthSucess extends AuthState{
  final String uId;
 const  AuthSucess(this. uId);
}

final class AuthFailure extends AuthState{
  final String message;
  const  AuthFailure(this. message);
}
