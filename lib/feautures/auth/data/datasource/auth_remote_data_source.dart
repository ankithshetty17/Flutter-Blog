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
  Future<String> signupWithEmailPassword({required String name, required String email, required String password}) {
    // TODO: implement signupWithEmailPassword
    throw UnimplementedError();
  }
  
}