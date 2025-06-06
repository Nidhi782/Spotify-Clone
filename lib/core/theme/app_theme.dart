import 'package:flutter/material.dart';
import 'package:spotify_2/core/theme/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.lightBackground,
      brightness: Brightness.light,
      fontFamily: 'Satoshi',
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.transparent,
          hintStyle: TextStyle(
            color: Color(0xff383838),
            fontWeight: FontWeight.w500,
          ),
          contentPadding: EdgeInsets.all(30),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.black, width: 0.4)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.black, width: 0.4))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              elevation: 0,
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)))));

  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: const Color.fromARGB(255, 5, 1, 1),
      brightness: Brightness.dark,
      fontFamily: 'Satoshi',
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.transparent,
          contentPadding: EdgeInsets.all(30),
          hintStyle: TextStyle(
            color: Color(0xffA7A7A7),
            fontWeight: FontWeight.w500,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.black, width: 0.4)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.white, width: 0.4))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)))));
}
