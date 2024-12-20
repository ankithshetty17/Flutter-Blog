

import 'package:blog/feautures/auth/domain/usecasses/user_signup.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignup _userSignup;
  AuthBloc({required UserSignup userSignup}):_userSignup = userSignup,
   super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async{
   final res =  await _userSignup(UserSignupParams(email: event.email, password: event.password, name: event.name));
   res.fold(
    (l)=>emit(AuthFailure(l.message)), 
    (r)=>emit(AuthSucess(r)));
    });
  }
}
