import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../data/services/auth_service.dart';
import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/modules/account/bindings/account_binding.dart';
import '../modules/profile/modules/account/views/account_view.dart';
import '../modules/profile/modules/addresses/bindings/addresses_binding.dart';
import '../modules/profile/modules/addresses/views/address_form_view.dart';
import '../modules/profile/modules/addresses/views/addresses_view.dart';
import '../modules/profile/modules/settings/bindings/settings_binding.dart';
import '../modules/profile/modules/settings/views/settings_view.dart';
import '../modules/profile/views/change_password_view.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/profile/views/security_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password/views/new_password_view.dart';
import '../modules/reset_password/views/otp_reset_password_view.dart';
import '../modules/reset_password/views/reset_password_view.dart';
import '../modules/reset_password/views/success_reset_password_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/contact_number_signin_view.dart';
import '../modules/signin/views/email_signin_view.dart';
import '../modules/signin/views/otp_signin_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/contact_number_signup_view.dart';
import '../modules/signup/views/email_signup_view.dart';
import '../modules/signup/views/otp_signup_view.dart';
import '../modules/wishlist/bindings/wishlist_binding.dart';
import '../modules/wishlist/views/wishlist_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final INITIAL =
      Get.find<AuthService>().isLoggedIn ? Routes.HOME : Routes.AUTH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
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
          name: _Paths.ADDRESSES,
          page: () => const AddressesView(),
          binding: AddressesBinding(),
          children: [
            GetPage(
              name: _Paths.FORM,
              page: () => const AddressFormView(),
              binding: AddressesBinding(),
            ),
          ],
        ),
        GetPage(
          name: _Paths.SECURITY,
          page: () => const SecurityView(),
          binding: ProfileBinding(),
          children: [
            GetPage(
              name: _Paths.CHANGEPASSWORD,
              page: () => const ChangePasswordView(),
              binding: ProfileBinding(),
            ),
          ],
        ),
        GetPage(
          name: _Paths.SETTINGS,
          page: () => const SettingsView(),
          binding: SettingsBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const ContactNumberSigninView(),
      binding: SigninBinding(),
      transition: Transition.fadeIn,
      children: [
        GetPage(
          name: _Paths.SIGNUP,
          page: () => const ContactNumberSignupView(),
          binding: SignupBinding(),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
          children: [
            GetPage(
              name: _Paths.CONTACT_NUMBER,
              page: () => const ContactNumberSignupView(),
              binding: SignupBinding(),
              transition: Transition.fade,
              transitionDuration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
            ),
            GetPage(
              name: _Paths.EMAIL,
              page: () => const EmailSignupView(),
              binding: SignupBinding(),
              transition: Transition.fade,
              transitionDuration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
            ),
            GetPage(
              name: _Paths.OTP,
              page: () => const OtpSignupView(),
              binding: SignupBinding(),
              transition: Transition.fade,
              transitionDuration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
            ),
          ],
        ),
        GetPage(
          name: _Paths.SIGNIN,
          page: () => const ContactNumberSigninView(),
          binding: SigninBinding(),
          children: [
            GetPage(
              name: _Paths.CONTACT_NUMBER,
              page: () => const ContactNumberSigninView(),
              binding: SigninBinding(),
              transition: Transition.fade,
              transitionDuration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
            ),
            GetPage(
              name: _Paths.EMAIL,
              page: () => const EmailSigninView(),
              binding: SigninBinding(),
              transition: Transition.fade,
              transitionDuration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
            ),
            GetPage(
              name: _Paths.OTP,
              page: () => const OtpSigninView(),
              binding: SigninBinding(),
              transition: Transition.fade,
              transitionDuration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
            ),
          ],
        ),
      ],
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
      children: [
        GetPage(
          name: _Paths.OTP,
          page: () => const OtpResetPasswordView(),
          binding: ResetPasswordBinding(),
        ),
        GetPage(
          name: _Paths.NEW_PASSWORD,
          page: () => const NewPasswordView(),
          binding: ResetPasswordBinding(),
        ),
        GetPage(
          name: _Paths.SUCCESS,
          page: () => const SuccessResetPasswordView(),
          binding: ResetPasswordBinding(),
          transition: Transition.cupertino,
          transitionDuration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        ),
      ],
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.WISHLIST,
      page: () => const WishlistView(),
      binding: WishlistBinding(),
      transition: Transition.fade,
    ),
  ];
}
