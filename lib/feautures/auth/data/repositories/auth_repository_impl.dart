import 'package:blog/core/error/exceptions.dart';
import 'package:blog/core/error/failures.dart';
import 'package:blog/feautures/auth/data/datasource/auth_remote_data_source.dart';
import 'package:blog/feautures/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class AuthRepositoryImpl implements AuthRepository{
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failures, String>> loginWithEmailPassword({required String email, required String password}) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, String>> signupWithEmailPassword({required String email, required String name, required String password}) 
  async{
    try{
     final userId =  await remoteDataSource.signupWithEmailPassword(
        name: name, email: email, password: password);
         return right(userId);
    }
    
    on ServerExceptions catch(e){
      return left(Failures(e.message));

    }
   
  }
  
}