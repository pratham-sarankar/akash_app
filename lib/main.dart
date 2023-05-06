import 'package:akash/app/data/repositories/address_repository.dart';
import 'package:akash/app/data/repositories/auth_repository.dart';
import 'package:akash/app/data/repositories/cart_repository.dart';
import 'package:akash/app/data/repositories/product_repository.dart';
import 'package:akash/app/data/repositories/profile_repository.dart';
import 'package:akash/app/data/repositories/wishlist_repository.dart';
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
  Get.create<ProductRepository>(() => ProductRepository());

  // Initialize AuthService before putting/initializing any permanent repository.
  await Get.find<AuthService>().init();

  //Note: The permanent repositories above must be initialized on logging in also.
  //As these repositories are permanent, they will be initialized only once.
  //And on login it must be reinitialized so that the user specific data can be fetched.

  // Note:
  // 1. Cart Repository must be put after AuthService is initialized, because Cart Repository uses AuthService to get access token.
  // 2. Cart Repository Cart has RxList of live cart products. Hence, it should be permanent.
  Get.put<CartRepository>(CartRepository(), permanent: true);

  // Note:
  // 1. Wishlist Repository must be put after AuthService is initialized, because Wishlist Repository uses AuthService to get access token.
  // 2. Wishlist Repository Wishlist has RxList of live wishlist products. Hence, it should be permanent.
  Get.put<WishlistRepository>(WishlistRepository(), permanent: true);

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
