import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        useMaterial3: true,
        dividerTheme: const DividerThemeData(
          space: 50,
          endIndent: 20,
          indent: 20,
          thickness: 0.5,
        ),
        listTileTheme: const ListTileThemeData(
          minVerticalPadding: 15,
          contentPadding: EdgeInsets.symmetric(horizontal: 22),
          horizontalTitleGap: 5,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 0.5),
            gapPadding: 5,
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsets.only(left: 15),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelAlignment: FloatingLabelAlignment.start
        ),
      ),
    ),
  );
}
