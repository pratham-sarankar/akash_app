import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginLottiesWidget extends StatelessWidget {
  const LoginLottiesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LoginLottiesWidgetController(),
      builder: (controller) {
        return Obx(
          () => Container(
            width: Get.width,
            alignment: Alignment.center,
            child: controller.selectedLottie.value,
          ),
        );
      },
    );
  }
}

class LoginLottiesWidgetController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<String> lotties = [
    'https://assets7.lottiefiles.com/private_files/lf30_vb7v5ca0.json',
    'https://assets3.lottiefiles.com/packages/lf20_th0dbihx.json',
    // 'https://assets8.lottiefiles.com/packages/lf20_6YCRFI.json'
  ];
  late List<AnimationController> controllers;
  late Rx<LottieBuilder> selectedLottie;

  @override
  void onInit() {
    super.onInit();
    selectedLottie = Lottie.network(
      lotties.first,
      onLoaded: (composition) {
        onLottieLoaded(1, composition);
      },
      repeat: true,
    ).obs;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onLottieLoaded(int nextIndex, LottieComposition composition) {
    Future.delayed(composition.duration, () {
      selectedLottie.value = Lottie.network(
        lotties[nextIndex],
        onLoaded: (composition) {
          onLottieLoaded((nextIndex + 1) % lotties.length, composition);
        },
        repeat: true,
      );
    });
  }
}
