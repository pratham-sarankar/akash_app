import 'package:get/get.dart';

class ValidationService extends GetxService {
  String? validateContactNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (!RegExp(r'^\+').hasMatch(value)) {
      return 'Please start with a + sign';
    }
    if (!RegExp(r'^\+[0-9]{1,3}').hasMatch(value)) {
      return 'Please include a valid country code';
    }
    if (!RegExp(r'^\+(?:[0-9] ?){6,14}[0-9]$').hasMatch(value)) {
      return 'It should be at least 7 digits';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value)) {
      return 'Invalid Email format';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'At least 8 characters required';
    }
    if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[!@#$&*~]).{8,}$').hasMatch(value)) {
      if (!RegExp(r'^(?=.*?[A-Z]).{8,}$').hasMatch(value)) {
        return 'At least one uppercase character required';
      } else {
        return 'At least one special character required';
      }
    }
    return null;
  }

  String? validatePinCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Pin Code is required';
    }
    if (!RegExp(r'^\d{6}$').hasMatch(value)) {
      return 'Invalid Pin Code';
    }
    return null;
  }
}
