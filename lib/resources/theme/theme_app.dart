import 'package:flutter/material.dart';
import '../colors/colors_app.dart';

final Map<int, Color> color = {
  50: const Color.fromRGBO(51, 153, 255, .1),
  100: const Color.fromRGBO(51, 153, 255, .2),
  200: const Color.fromRGBO(51, 153, 255, .3),
  300: const Color.fromRGBO(51, 153, 255, .4),
  400: const Color.fromRGBO(51, 153, 255, .5),
  500: const Color.fromRGBO(51, 153, 255, .6),
  600: const Color.fromRGBO(51, 153, 255, .7),
  700: const Color.fromRGBO(51, 153, 255, .8),
  800: const Color.fromRGBO(51, 153, 255, .9),
  900: const Color.fromRGBO(51, 153, 255, 1),
};

class ThemeApp {
  static final light = ThemeData(
    fontFamily: 'Montserrat',
    brightness: Brightness.light,
    primarySwatch: MaterialColor(0xFF081F32, color),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: AppColors.button,
        minimumSize: const Size(127, 46),
        textStyle: const TextStyle(
          color: AppColors.textButton,
          fontSize: 18,
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      ),
    ),
    textTheme: const TextTheme(
      headline2: TextStyle(
        fontSize: 12,
        color: AppColors.title,
        fontWeight: FontWeight.w300,
        fontFamily: 'Montserrat',
      ),
      headline3: TextStyle(
        fontSize: 25,
        color: AppColors.title,
        fontWeight: FontWeight.w500,
      ),
      headline6: TextStyle(
        fontSize: 16,
        color: AppColors.title,
        fontWeight: FontWeight.w800,
        fontFamily: 'Montserrat',
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
    inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.textField, width: 2.0),
            borderRadius: BorderRadius.circular(5.0)),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: const TextStyle(fontSize: 20.0, color: AppColors.textField),
        labelStyle: const TextStyle(color: AppColors.title, fontSize: 20)),
    iconTheme: const IconThemeData(
      color: AppColors.infoCircleIcon,
      size: 40,
    ),
  );
}
