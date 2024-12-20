import 'package:blog/core/error/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future <String> signupWithEmailPassword({
       required String name,
       required String email,
       required String password,
  });

   Future <String> loginWithEmailPassword({
       required String email,
       required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{      
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl({required this.supabaseClient});
  
  @override
  Future<String> loginWithEmailPassword({required String email, required String password}) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<String> signupWithEmailPassword({required String name, required String email, required String password}) 
  async{
    try{
    final response = await  supabaseClient.auth.signUp(
        password: password,
        email: email,
        data: {
          'name' : name
        });
        if(response.user == null){
          throw ServerExceptions('User is Null');
        }
        return response.user!.id;

    }catch(e){
         throw ServerExceptions(e.toString());
    }
  }
  
}