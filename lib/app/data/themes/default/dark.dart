import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final defaultDarkTheme = ThemeData.dark(useMaterial3: true).copyWith(
  textTheme: GoogleFonts.poppinsTextTheme(Typography.whiteMountainView),
  dividerTheme: const DividerThemeData(
    space: 50,
    endIndent: 20,
    indent: 20,
    thickness: 0.5,
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      // backgroundColor: Colors.blue,
      // foregroundColor: Colors.white,
      minimumSize: const Size(double.infinity, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  listTileTheme: const ListTileThemeData(
    contentPadding: EdgeInsets.symmetric(horizontal: 20),
    horizontalTitleGap: 5,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: const BorderSide(width: 0.5),
      gapPadding: 5,
      borderRadius: BorderRadius.circular(8),
    ),
    contentPadding:
    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    floatingLabelAlignment: FloatingLabelAlignment.start,
  ),
);