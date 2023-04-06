import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AuthLottieAnimation extends StatelessWidget {
  const AuthLottieAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AuthLottieAnimationController(),
      builder: (controller) {
        return Hero(
          tag: "login_lottie",
          child: Lottie.network(
            'https://assets8.lottiefiles.com/packages/lf20_6YCRFI.json',
            controller: controller.authLottieController,
          ),
        );
      },
    );
  }
}

class AuthLottieAnimationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController authLottieController;

  @override
  void onInit() {
    super.onInit();
    authLottieController = AnimationController(vsync: this)
      ..repeat(
        period: const Duration(seconds: 5),
      );
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
