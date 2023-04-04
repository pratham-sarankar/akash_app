import 'package:akash/app/modules/profile/modules/settings/bindings/settings_binding.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/profile/modules/account/bindings/account_binding.dart';
import '../modules/profile/modules/account/views/account_view.dart';
import '../modules/profile/modules/addresses/bindings/addresses_binding.dart';
import '../modules/profile/modules/addresses/views/addresses_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/modules/settings/views/settings_view.dart';
import '../modules/profile/views/profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.PROFILE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
      children: [
        GetPage(
          name: _Paths.ACCOUNT,
          page: () => const AccountView(),
          binding: AccountBinding(),
        ),
        GetPage(
          name: _Paths.SETTINGS,
          page: () => const SettingsView(),
          binding: SettingsBinding(),
        ),
        GetPage(
          name: _Paths.ADDRESSES,
          page: () => const AddressesView(),
          binding: AddressesBinding(),
        ),
      ],
    ),
  ];
}
