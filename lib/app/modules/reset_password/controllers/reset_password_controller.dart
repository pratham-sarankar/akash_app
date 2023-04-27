import 'package:akash/app/data/repositories/auth_repository.dart';
import 'package:akash/app/data/services/toast_service.dart';
import 'package:akash/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  late RxBool isLoading;
  late GlobalKey<FormState> formKey;
  String? identity;

  @override
  void onInit() {
    isLoading = false.obs;
    formKey = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void resetPassword() async {
    try {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        isLoading.value = true;
        if (identity == null) {
          //TODO: Show formatted error for this case
          return;
        }
        String verificationToken =
            await Get.find<AuthRepository>().resetPassword(identity!);
        isLoading.value = false;
        bool shouldResend =
            await Get.toNamed(Routes.OTP_RESET_PASSWORD, arguments: {
          'verification_token': verificationToken,
          'sent_to': identity,
        });
        if (shouldResend) {
          resetPassword();
        }
      }
    } catch (e) {
      isLoading.value = false;
      Get.find<ToastService>().showErrorMessage(e.toString());
    }
  }
}
