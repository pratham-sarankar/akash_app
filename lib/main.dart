import 'package:akash/app/data/repositories/address_repository.dart';
import 'package:akash/app/data/repositories/auth_repository.dart';
import 'package:akash/app/data/repositories/profile_repository.dart';
import 'package:akash/app/data/services/auth_service.dart';
import 'package:akash/app/data/services/toast_service.dart';
import 'package:akash/app/data/services/validation_service.dart';
import 'package:akash/app/data/themes/default/default_theme.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Services
  Get.put<ToastService>(ToastService(), permanent: true);
  Get.put<AuthService>(AuthService(), permanent: true);
  Get.create<ValidationService>(() => ValidationService());

  //Repositories
  Get.create<AuthRepository>(() => AuthRepository());
  Get.create<ProfileRepository>(() => ProfileRepository());
  Get.create<AddressRepository>(() => AddressRepository());

  //Initialization
  await Get.find<AuthService>().init();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Akash",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      themeMode: ThemeMode.light,
      builder: (context, child) {
        if (Get.width < 600) {
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
