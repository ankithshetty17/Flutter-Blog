import 'package:blog/core/theme/app_pallette.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static  _border([Color color =AppPallete.borderColor]) => OutlineInputBorder(
        borderSide: BorderSide(color: color,width: 2),
        borderRadius: BorderRadius.circular(18)
       );
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
       enabledBorder: _border(),
       focusedBorder: _border(AppPallete.gradient2),
       contentPadding: EdgeInsets.all(20),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppPallete.backgroundColor
    )
  );
}