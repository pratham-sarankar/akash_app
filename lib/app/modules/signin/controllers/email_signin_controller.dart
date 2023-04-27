import 'package:akash/app/data/repositories/auth_repository.dart';
import 'package:akash/app/data/services/toast_service.dart';
import 'package:akash/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EmailSigninController extends GetxController {
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
        bool result = await Get.find<AuthRepository>()
            .signInWithEmailAndPassword(email!, password!);
        isLoading.value = false;

        if (result) {
          Get.offAllNamed(Routes.HOME);
        }
      }
    } catch (e) {
      isLoading.value = false;
      Get.find<ToastService>().showErrorMessage(e.toString());
    }
  }
}
