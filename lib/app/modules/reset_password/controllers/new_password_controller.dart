import 'package:akash/app/data/repositories/profile_repository.dart';
import 'package:akash/app/data/services/toast_service.dart';
import 'package:akash/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NewPasswordController extends GetxController {
  late GlobalKey<FormState> formKey;
  late RxBool isLoading;
  String? accessToken;

  String? newPassword;
  String? confirmPassword;

  late RxBool isConfirmPasswordHidden;
  late RxBool isPasswordHidden;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    isLoading = false.obs;
    accessToken = Get.arguments;
    isConfirmPasswordHidden = true.obs;
    isPasswordHidden = true.obs;
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
        if (accessToken == null || newPassword == null) {
          //TODO: Show formatted error for this case
          return;
        }
        final repository = Get.find<ProfileRepository>();
        var result = await repository.resetPassword(accessToken: accessToken!,password: newPassword!);
        isLoading.value = false;
        if (result) {
          Get.toNamed(Routes.RESET_PASSWORD_SUCCESS);
        }
      }
    } catch (e) {
      isLoading.value = false;
      Get.find<ToastService>().showErrorMessage(e.toString());
    }
  }
}
