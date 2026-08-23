import 'package:flutter/material.dart';
class AppTheme {
  static Color primaruColor = const Color(0xff3598DB);
  static Color blackcolor = const Color(0xff141922);
  static Color greycolor = const Color(0xff7f7f7f);
  static Color whitecolor = Colors.white;

  static ThemeData lightTheme = ThemeData(
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              textStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: AppTheme.whitecolor
              ),
              foregroundColor: AppTheme.blackcolor
          )

      ),
      primaryColor: primaruColor,
      appBarTheme: AppBarTheme(
        centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
              color: whitecolor,
              fontSize: 20,
              fontWeight: FontWeight.bold
          )
      ),
      textTheme: TextTheme(
          bodyLarge: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: blackcolor
          ),
          bodyMedium: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: primaruColor
          ),
          bodySmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: blackcolor
          ),
          titleMedium: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: blackcolor
          ),
        displaySmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: blackcolor
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: greycolor,
          fontSize: 16,
          fontWeight: FontWeight.w400
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: greycolor.withOpacity(.8),
              width: 1
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: primaruColor,
              width: 2
          ),
        ),
      ),
      scaffoldBackgroundColor: whitecolor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: primaruColor,
        unselectedItemColor: greycolor,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaruColor,
          foregroundColor: whitecolor,
          shape: const CircleBorder()
      )

  );
}