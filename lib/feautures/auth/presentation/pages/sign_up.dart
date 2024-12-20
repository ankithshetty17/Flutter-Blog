import 'package:blog/core/theme/app_pallette.dart';
import 'package:blog/feautures/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog/feautures/auth/presentation/pages/login_page.dart';
import 'package:blog/feautures/auth/presentation/widgets/auth_feild.dart';
import 'package:blog/feautures/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {
  static route() =>  MaterialPageRoute(
    builder: (context) => SignUp()
    );
  const SignUp({super.key});

  @override   
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final fromKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.push(context,
          LoginPage.route());
        }, 
        icon: Icon(Icons.arrow_back_ios,
        color: AppPallete.greyColor,
        size: 19,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: fromKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sign Up.',
              style: TextStyle(fontSize: 42,
               color: AppPallete.greyColor,
               fontWeight: FontWeight.bold),
               ),
               SizedBox(height: 30),
               AuthFeild(hintText: 'Name',controller: nameController,),
                SizedBox(height: 15),
               AuthFeild(hintText: 'Email',controller:emailController,),
                SizedBox(height: 15),
               AuthFeild(hintText: 'Password',
               controller: passwordController,
               isObscureText: true,),
              SizedBox(height: 25),
              AuthGradientButon(
                onPressed: (){
                  if(fromKey.currentState!.validate()){
                    context.read<AuthBloc>().add(
                      AuthSignUp(email: emailController.text.trim(), 
                      password:passwordController.text.trim(),
                       name: nameController.text.trim())
                    );
                  }
                },
                butonText: 'SignUp',
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                  LoginPage.route());
                },
                child: RichText(text: TextSpan(
                  text: "Already have an account?  ",
                  style:Theme.of(context).textTheme.titleSmall,
                  children: [
                    TextSpan(
                      text: 'Signin',
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