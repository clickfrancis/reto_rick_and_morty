import 'package:flutter/material.dart';
import '../colors/colors_app.dart';

class ThemeApp {
  static final light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.grey,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: AppColors.button,
        minimumSize: const Size(127, 46),
        textStyle: const TextStyle(
          color: AppColors.textButton,
          fontSize: 18,
        ),
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    ),
    textTheme: const TextTheme(
      headline3: TextStyle(
        fontSize: 25,
        color: AppColors.title,
        fontWeight: FontWeight.w500,
      ),
      subtitle1: TextStyle(
        fontSize: 16,
        color: AppColors.description,
        fontWeight: FontWeight.w400,
      ),
    ),
    dialogTheme: const DialogTheme(
        backgroundColor: AppColors.textButton,
        contentTextStyle: TextStyle(
          fontSize: 24,
          color: AppColors.title,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        )),
    inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.zero),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextStyle(color: AppColors.title, fontSize: 20)),
    iconTheme: const IconThemeData(
      color: AppColors.infoCircleIcon,
      size: 40,
    ),
  );
}
