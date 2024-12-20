import 'package:blog/core/secrets/app_secrets.dart';
import 'package:blog/core/theme/app_theme.dart';
import 'package:blog/feautures/auth/data/datasource/auth_remote_data_source.dart';
import 'package:blog/feautures/auth/data/repositories/auth_repository_impl.dart';
import 'package:blog/feautures/auth/domain/usecasses/user_signup.dart';
import 'package:blog/feautures/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog/feautures/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   final supabase = await Supabase.initialize(
    anonKey:AppSecrets.supabaseAnnonKey ,
    url: AppSecrets.supabaseUrl
    );
  runApp( MultiBlocProvider(
    providers: [
      BlocProvider(create: (_)=> AuthBloc(
        userSignup: 
        UserSignup(
            AuthRepositoryImpl(
              AuthRemoteDataSourceImpl(supabase.client)))))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkThemeMode,
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

