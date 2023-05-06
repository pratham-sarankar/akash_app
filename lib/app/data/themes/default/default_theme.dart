import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultTheme {
  static ThemeData get dark => ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: const ColorScheme(
          primary: Color(0xFFFF8C00),
          // Primary brand color (orange)
          primaryContainer: Color(0xFFFFA500),
          // A shade darker than primary
          secondary: Color(0xFF81C784),
          // A green color for secondary actions
          secondaryContainer: Color(0xFF4CAF50),
          // A shade darker than secondary
          surface: Color(0xFF1E1E1E),
          // Color for surfaces such as cards, dialogs, and menus
          background: Color(0xFF121212),
          // Color for the background of the app
          error: Color(0xFFCF6679),
          // Error color
          onPrimary: Colors.black,
          // Color for text on the primary color
          onSecondary: Colors.black,
          // Color for text on the secondary color
          onSurface: Colors.white,
          // Color for text on surfaces
          onBackground: Colors.white,
          // Color for text on the background color
          onError: Colors.white,
          // Color for text on error color
          brightness: Brightness.dark, // Sets the brightness to dark
        ),
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          surfaceTintColor: Color(0xFF121212),
        ),
        textTheme:
            GoogleFonts.poppinsTextTheme(Typography.material2021().white),
        dividerTheme: const DividerThemeData(
          space: 50,
          endIndent: 20,
          indent: 20,
          thickness: 0.5,
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
          errorBorder: OutlineInputBorder(
            gapPadding: 5,
            borderSide: BorderSide(color: Colors.red.shade800),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            gapPadding: 5,
            borderSide: BorderSide(color: Colors.red.shade800),
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelAlignment: FloatingLabelAlignment.start,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            foregroundColor: Colors.orange.shade900,
            side: BorderSide(
              color: Colors.orange.shade900,
              width: 1.5,
            ),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          side: const BorderSide(
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
          splashRadius: 10,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedIconTheme: const IconThemeData(
            color: Color(0xFFFF8C00),
          ),
          elevation: 20,
          selectedLabelStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
          ),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: const Color(0xFFFF8C00),
          unselectedItemColor: const Color(0xffbebebe),
          unselectedLabelStyle: GoogleFonts.poppins(),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.orange.shade800,
            foregroundColor: Colors.white,
            surfaceTintColor: Colors.orange.shade200,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      );

  static ThemeData get light => ThemeData.light(useMaterial3: true).copyWith(
        colorScheme: ColorScheme(
          primary: const Color(0xFFFF8C00),
          // Primary brand color (darker shade of orange)
          primaryContainer: const Color(0xFFFFA500),
          // A shade lighter than primary
          secondary: const Color(0xFF4CAF50),
          // A green color for secondary actions
          secondaryContainer: const Color(0xFF388E3C),
          // A shade darker than secondary
          surface: Colors.white,
          // Color for surfaces such as cards, dialogs, and menus
          background: Colors.white,
          // Color for the background of the app
          error: const Color(0xFFB00020),
          // Error color
          onPrimary: Colors.white,
          // Color for text on the primary color
          onSecondary: Colors.white,
          // Color for text on the secondary color
          onSurface: Colors.black,
          // Color for text on surfaces
          onBackground: Colors.black,
          // Color for text on the background color
          onError: Colors.white,
          // Color for text on error color
          brightness: Brightness.light,
          // Sets the brightness to light
          onInverseSurface: Colors.grey.shade100,
          shadow: Colors.grey.shade100,
        ),
        scaffoldBackgroundColor: Colors.white,
        // Color for the app scaffold
        textTheme:
            GoogleFonts.poppinsTextTheme(Typography.material2021().black),
        dividerTheme: const DividerThemeData(
          space: 50,
          endIndent: 20,
          indent: 20,
          thickness: 0.5,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.orange.shade800,
            foregroundColor: Colors.white,
            surfaceTintColor: Colors.orange.shade200,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            foregroundColor: Colors.orange.shade900,
            side: BorderSide(
              color: Colors.orange.shade900,
              width: 1.5,
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
          errorBorder: OutlineInputBorder(
            gapPadding: 5,
            borderSide: BorderSide(color: Colors.red.shade800),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            gapPadding: 5,
            borderSide: BorderSide(color: Colors.red.shade800),
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelAlignment: FloatingLabelAlignment.start,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
        dialogBackgroundColor: Colors.white,
        dialogTheme: const DialogTheme(
          backgroundColor: Colors.white,
        ),
        dividerColor: Colors.grey.shade300,
        checkboxTheme: CheckboxThemeData(
          side: const BorderSide(
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
          splashRadius: 10,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedIconTheme: const IconThemeData(
            color: Color(0xFFFF8C00),
          ),
          backgroundColor: Colors.white,
          elevation: 20,
          selectedLabelStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
          ),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: const Color(0xFFFF8C00),
          unselectedItemColor: const Color(0xffbebebe),
          unselectedLabelStyle: GoogleFonts.poppins(),
        ),
      );
}
