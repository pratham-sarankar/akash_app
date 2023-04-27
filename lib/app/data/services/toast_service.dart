import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ToastService extends GetxService {
  void showErrorMessage(String message, {String title = "Error"}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      barBlur: 25,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
    );
  }

  void showSuccessMessage(String message, {String title = "Success"}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      barBlur: 25,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
    );
  }
}
