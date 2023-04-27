part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();

  //User Auth Routes
  static const AUTH = _Paths.AUTH;
  static const SIGNUP = AUTH + _Paths.SIGNUP;
  static const SIGNIN = AUTH + _Paths.SIGNIN;

  //Signup Routes
  static const CONTACT_NUMBER_SIGNUP = SIGNUP + _Paths.CONTACT_NUMBER;
  static const EMAIL_SIGNUP = SIGNUP + _Paths.EMAIL;
  static const OTP_SIGNUP = SIGNUP + _Paths.OTP;

  //Signin Routes
  static const CONTACT_NUMBER_SIGNIN = SIGNIN + _Paths.CONTACT_NUMBER;
  static const EMAIL_SIGNIN = SIGNIN + _Paths.EMAIL;
  static const OTP_SIGNIN = SIGNIN + _Paths.OTP;

  //Reset Password Routes
  static const RESET_PASSWORD = _Paths.RESET_PASSWORD;
  static const OTP_RESET_PASSWORD = RESET_PASSWORD + _Paths.OTP;
  static const NEW_PASSWORD = RESET_PASSWORD + _Paths.NEW_PASSWORD;
  static const RESET_PASSWORD_SUCCESS = RESET_PASSWORD + _Paths.SUCCESS;

  //Profile Routes
  static const PROFILE = _Paths.PROFILE;
  static const ACCOUNT = PROFILE + _Paths.ACCOUNT;
  static const SETTINGS = PROFILE + _Paths.SETTINGS;
  static const ADDRESSES = PROFILE + _Paths.ADDRESSES;
  static const ADDRESS_FORM = ADDRESSES + _Paths.FORM;
  static const SECURITY = PROFILE + _Paths.SECURITY;
  static const CHANGEPASSWORD = SECURITY + _Paths.CHANGEPASSWORD;

  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const OTP = _Paths.OTP;
  static const CART = _Paths.CART;
}

abstract class _Paths {
  _Paths._();

  //Joiner Paths
  static const AUTH = '/auth';
  static const CONTACT_NUMBER = '/contact-number';
  static const EMAIL = '/email';
  static const FORM = '/form';

  static const HOME = '/home';
  static const PROFILE = '/profile';
  static const ACCOUNT = '/account';
  static const SETTINGS = '/settings';
  static const ADDRESSES = '/addresses';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const SECURITY = '/security';
  static const CHANGEPASSWORD = '/change-password';
  static const OTP = '/otp';
  static const SIGNUP = '/signup';
  static const SIGNIN = '/signin';
  static const RESET_PASSWORD = '/reset-password';
  static const NEW_PASSWORD = '/new-password';
  static const SUCCESS = '/success';
  static const CART = '/cart';
}
