import 'package:blog/core/secrets/app_secrets.dart';
import 'package:blog/core/theme/app_theme.dart';
import 'package:blog/feautures/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Supabase.initialize(
    anonKey:AppSecrets.supabaseAnnonKey ,
    url: AppSecrets.supabaseUrl
    );
  runApp(const MyApp());
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

