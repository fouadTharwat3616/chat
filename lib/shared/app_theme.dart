import 'package:flutter/material.dart';
class AppTheme{
  static Color primaruColor=Color(0xff3598DB);
  static Color blackcolor=Color(0xff141922);
  static Color greycolor=Color(0xffC8C9CB);
  static Color whitecolor=Colors.white;

  static ThemeData lightTheme=ThemeData(
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
          color:AppTheme.whitecolor
        ),
        foregroundColor: AppTheme.blackcolor
      )

    ),
    primaryColor: primaruColor,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: primaruColor,
      titleTextStyle: TextStyle(
        color: whitecolor,
        fontSize: 22,
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
          )
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder:UnderlineInputBorder(
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
      shape: CircleBorder(side: BorderSide(color: whitecolor,width: 2))
    )

  );
  static ThemeData DarkTheme=ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: primaruColor,
      elevation: 0,
        titleTextStyle: TextStyle(
            color: blackcolor,
            fontSize: 22,
            fontWeight: FontWeight.bold
        )
    ),
    scaffoldBackgroundColor: whitecolor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaruColor,
          foregroundColor: whitecolor,
          shape: CircleBorder(side: BorderSide(color: blackcolor,width: 2))
      ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder:UnderlineInputBorder(
        borderSide: BorderSide(
            color: greycolor.withOpacity(.8),
            width: 1,

        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
            color: primaruColor,
            width: 2
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            textStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color:AppTheme.whitecolor
            ),
            foregroundColor: AppTheme.blackcolor
        ),
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
        )
    ),
  );
}
