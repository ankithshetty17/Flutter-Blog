import 'package:blog/core/theme/app_pallette.dart';
import 'package:blog/feautures/auth/presentation/pages/sign_up.dart';
import 'package:blog/feautures/auth/presentation/widgets/auth_feild.dart';
import 'package:blog/feautures/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(
    builder: (context)=> LoginPage());
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _SignUpState();
}

class _SignUpState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fromKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: fromKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sign In.',
              style: TextStyle(fontSize: 42,
               color: AppPallete.greyColor,
               fontWeight: FontWeight.bold),
               ),
               SizedBox(height: 30),
               AuthFeild(hintText: 'Email',controller:emailController,),
                SizedBox(height: 15),
               AuthFeild(hintText: 'Password',
               controller: passwordController,
               isObscureText: true,),
              SizedBox(height: 25),
              AuthGradientButon(
                 butonText: 'Signin',
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                  SignUp.route());
                },
                child: RichText(text: TextSpan(
                  text: "Dont\t have an account?  ",
                  style:Theme.of(context).textTheme.titleSmall,
                  children: [
                    TextSpan(
                      text: 'Signup',
                     style:Theme.of(context).textTheme.titleSmall?.copyWith(color: AppPallete.gradient2),
                    )
                  ]
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}