import 'package:akash/app/data/repositories/auth_repository.dart';
import 'package:akash/app/data/services/toast_service.dart';
import 'package:akash/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EmailSignupController extends GetxController {
  late RxBool isLoading;
  late RxBool isPasswordVisible;

  String? email;
  String? password;

  late GlobalKey<FormState> formKey;

  @override
  void onInit() {
    isLoading = false.obs;
    isPasswordVisible = false.obs;
    formKey = GlobalKey<FormState>();
    super.onInit();
  }

  void toggleVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void login() async {
    try {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        if (email == null || password == null) {
          //TODO: Show a formatted error message
          return;
        }
        isLoading.value = true;
        String verificationToken = await Get.find<AuthRepository>()
            .signUpWithEmailAndPassword(email!, password!);
        isLoading.value = false;
        Get.toNamed(Routes.OTP_SIGNUP, arguments: {
          "verification_token": verificationToken,
          "sent_to": email,
        });
      }
    } catch (e) {
      isLoading.value = false;
      Get.find<ToastService>().showErrorMessage(e.toString());
    }
  }
}
