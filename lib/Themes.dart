import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  //Scheme color
  colorScheme: const ColorScheme(
    //It mododifies how dark a color is displayed
    brightness: Brightness.light,

    primary: Color(0xff0E77B1),
    onPrimary: Colors.white,

    secondary: Color(0xffD2E4EE),
    onSecondary: Color(0xff0E77B1),

    error: Color(0xffFF8484),
    onError: Color(0xffB92A2A),

    //It modifies body background color
    background: Colors.white,
    onBackground: Color(0xff0E77B1),

    //It modifies appbar's background color
    surface: Color(0xffD9D9D9),
    onSurface: Color(0xff767676),
  ),

  //App BarTheme
  appBarTheme: AppBarTheme(
    backgroundColor: const Color(0xff0E77B1),
    titleTextStyle: GoogleFonts.electrolize(
      fontSize: 30,
      color: const Color(0xffffffff),
    ),
    actionsIconTheme: const IconThemeData(
      color: Color(0xffffffff),
      size: 35,
    ),
  ),

  //Floating Action Button
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xff0E77B1),
    splashColor: Color(0xff98bdd1),
    iconSize: 35,
    extendedPadding: EdgeInsets.fromLTRB(0.0, 0.0, 24.0, 24.0),
  ),

  //Card Theme
  cardTheme: const CardTheme(
    color: Color(0xff0E77B1),
    margin: EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0),
  ),

  //Input Decoration
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        width: 4.0,
        color: Color(0xff454242),
      ),
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(12),
      ),
    ),

    filled: true,
    fillColor: const Color(0xffd9d9d9),
    hoverColor: const Color.fromARGB(255, 185, 205, 214),
    focusColor: const Color(0xff0E77B1),

    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff0E77B1),
        width: 4,
      ),
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(12),
      ),
    ),

    //Label Text Input Decoration
    labelStyle: GoogleFonts.electrolize(
      fontSize: 14,
      color: const Color(0xff767676),
    ),

    hintStyle: GoogleFonts.electrolize(
      fontSize: 14,
      color: const Color(0xff767676),
    ),

    counterStyle: GoogleFonts.electrolize(
      fontSize: 14,
      color: const Color(0xff767676),
    ),
  ),
);

ThemeData darkTheme = ThemeData();

/*
brightness: Brightness.light,
    primary: Color(0xff0E77B1),
    onPrimary: Colors.white,
    secondary: Color(0xffD2E4EE),
    onSecondary: Color(0xff0E77B1),
    error: Color(0xffFF8484),
    onError: Color(0xffB92A2A),
    background: Colors.white,
    onBackground: Color(0xff0E77B1),
    surface: Color(0xffD9D9D9),
    onSurface: Color(0xff767676),
*/
