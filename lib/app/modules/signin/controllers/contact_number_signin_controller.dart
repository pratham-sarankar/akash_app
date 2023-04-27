import 'package:akash/app/data/repositories/auth_repository.dart';
import 'package:akash/app/data/services/toast_service.dart';
import 'package:akash/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ContactNumberSigninController extends GetxController {
  late GlobalKey<FormState> formKey;

  late String? contactNumber;

  late RxBool isLoading;

  @override
  void onInit() {
    isLoading = false.obs;
    formKey = GlobalKey<FormState>();
    super.onInit();
  }

  void login() async {
    try {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        if (contactNumber == null) {
          //TODO: Show a formatted error message
          return;
        }
        isLoading.value = true;
        String verificationToken = await Get.find<AuthRepository>()
            .signInWithContactNumber(contactNumber!);
        isLoading.value = false;
        var shouldResend = await Get.toNamed(Routes.OTP_SIGNIN, arguments: {
          "verification_token": verificationToken,
          "sent_to": contactNumber,
        });
        if (shouldResend) {
          login();
        }
      }
    } catch (e) {
      isLoading.value = false;
      Get.find<ToastService>().showErrorMessage(e.toString());
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
