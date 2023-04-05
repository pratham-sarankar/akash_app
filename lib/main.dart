import 'package:akash/app/data/themes/default/default_theme.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Akash",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      themeMode: ThemeMode.light,
      builder: (context, child) {
        if (GetPlatform.isAndroid||GetPlatform.isIOS) {
          return child!;
        }
        return DeviceFrame(
          device: Devices.ios.iPhone13ProMax,
          screen: child!,
          orientation: Orientation.portrait,
        );
      },
      theme: DefaultTheme.light,
      darkTheme: DefaultTheme.dark,
    ),
  );
}
