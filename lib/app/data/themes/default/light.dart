import 'package:akash/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';



final defaultLightTheme = ThemeData.light(useMaterial3: true).copyWith(
  colorScheme: const ColorScheme(
    primary: Color(0xFFFF8C00), // Primary brand color (darker shade of orange)
    primaryContainer: Color(0xFFFFA500), // A shade lighter than primary
    secondary: Color(0xFF4CAF50), // A green color for secondary actions
    secondaryContainer: Color(0xFF388E3C), // A shade darker than secondary
    surface:
        Colors.white, // Color for surfaces such as cards, dialogs, and menus
    background: Colors.white, // Color for the background of the app
    error: Color(0xFFB00020), // Error color
    onPrimary: Colors.white, // Color for text on the primary color
    onSecondary: Colors.white, // Color for text on the secondary color
    onSurface: Colors.black, // Color for text on surfaces
    onBackground: Colors.black, // Color for text on the background color
    onError: Colors.white, // Color for text on error color
    brightness: Brightness.light, // Sets the brightness to light
  ),
  scaffoldBackgroundColor: Colors.white, // Color for the app scaffold
  textTheme: GoogleFonts.poppinsTextTheme(Typography.blackMountainView),
  dividerTheme: const DividerThemeData(
    space: 50,
    endIndent: 20,
    indent: 20,
    thickness: 0.5,
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    surfaceTintColor: Colors.white,
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
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 0.5, color: Colors.grey.shade600),
      gapPadding: 5,
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      gapPadding: 5,
      borderRadius: BorderRadius.circular(8),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    floatingLabelAlignment: FloatingLabelAlignment.start,
  ),
);
