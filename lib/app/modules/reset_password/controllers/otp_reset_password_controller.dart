import 'dart:async';

import 'package:akash/app/data/repositories/auth_repository.dart';
import 'package:akash/app/data/services/toast_service.dart';
import 'package:akash/app/routes/app_pages.dart';
import 'package:get/get.dart';

class OtpResetPasswordController extends GetxController {
  late String verificationToken;
  late String sentTo;
  late String otp;

  late RxBool isLoading;
  late RxInt _secondsRemaining;
  late Timer _timer;
  late RxBool canResend;

  @override
  void onInit() {
    verificationToken = Get.arguments['verification_token'] ?? "";
    sentTo = Get.arguments['sent_to'] ?? "your contact";
    otp = "";
    isLoading = false.obs;
    canResend = false.obs;
    _secondsRemaining = 120.obs;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        _secondsRemaining--;
      } else {
        timer.cancel();
        canResend.value = true;
      }
    });
    super.onInit();
  }

  String get formattedSeconds {
    String twoDigits(num n) => n.toString().padLeft(2, "0");
    String minutes = twoDigits((_secondsRemaining / 60).floor());
    String secondsString = twoDigits(_secondsRemaining % 60);
    return "$minutes:$secondsString";
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void proceed() async {
    try {
      isLoading.value = true;
      String accessToken =
          await Get.find<AuthRepository>().verifyOtp(otp, verificationToken);
      isLoading.value = false;
      Get.toNamed(Routes.NEW_PASSWORD, arguments: accessToken);
    } catch (e) {
      isLoading.value = false;
      Get.find<ToastService>().showErrorMessage(e.toString());
    }
  }

  void resend() {
    Get.back(result: true);
  }
}
