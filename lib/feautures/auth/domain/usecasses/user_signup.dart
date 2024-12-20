import 'package:blog/core/error/failures.dart';
import 'package:blog/core/usecase/usecase.dart';
import 'package:blog/feautures/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class  UserSignup implements UserCase<String,UserSignupParams>{
  final AuthRepository authRepository;
  UserSignup(this.authRepository);
  @override
  Future<Either<Failures, String>> call(UserSignupParams params) async{
    return await authRepository.signupWithEmailPassword(
      email: params.email, 
      name: params.name, 
      password: params.password);
  }

}

class UserSignupParams{
  final String email;
  final String password;
  final String name;
  UserSignupParams({required this.email, required this.password, required this.name});
  
}