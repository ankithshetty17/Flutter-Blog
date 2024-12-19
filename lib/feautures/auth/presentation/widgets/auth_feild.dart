import 'package:blog/core/theme/app_pallette.dart';
import 'package:flutter/material.dart';


class AuthFeild extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscureText;
  const AuthFeild({
    super.key, required this.hintText, 
    required this.controller,
    this.isObscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: AppPallete.greyHint,fontSize: 12,fontWeight: FontWeight.bold)
      ),
      obscureText: isObscureText,
      obscuringCharacter: '*',
      validator: (value){
        if(value!.isEmpty){
           return "'$hintText is missing'";
        }
        return null;
      },
    );
  }
}