import 'package:blog/core/theme/app_pallette.dart';
import 'package:flutter/material.dart';

class AuthGradientButon extends StatelessWidget {
  final String butonText;
  const AuthGradientButon({super.key, required this.butonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
              AppPallete.gradient1,
              AppPallete.gradient2
        ],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(onPressed: (){}, 
      style: ElevatedButton.styleFrom(
        elevation: 0,
        fixedSize: Size(395,55),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
      ),
      child: Text(butonText,
      style: TextStyle(fontSize: 14,color:AppPallete.whiteColor),)),
    );
  }
}