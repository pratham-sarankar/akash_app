import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class AuthController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController authLottieController;

  @override
  void onInit() {
    authLottieController = AnimationController(vsync: this)..repeat(
      period: const Duration(seconds: 5),
    );
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    authLottieController.dispose();
    super.onClose();
  }

}
