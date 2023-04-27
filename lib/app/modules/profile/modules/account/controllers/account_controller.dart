import 'package:akash/app/data/repositories/profile_repository.dart';
import 'package:akash/app/data/services/toast_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  late GlobalKey<FormState> formKey;
  late RxBool isLoading;

  String? username;
  String? displayName;
  String? contactNumber;
  String? dateOfBirth;
  String? email;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    isLoading = false.obs;
    super.onInit();
  }

  void updateProfilePicture() async {
    try {
      String? result =
          await Get.find<ProfileRepository>().updateProfilePicture();
      if (result != null) {
        Get.find<ToastService>().showSuccessMessage(result);
      }
    } catch (e) {
      Get.find<ToastService>().showErrorMessage(e.toString());
    }
  }

  void submit() async {
    try {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        isLoading.value = true;
        await Get.find<ProfileRepository>().updateProfile(
          username: username,
          displayName: displayName,
          contactNumber: contactNumber,
          email: email,
        );
        isLoading.value = false;
        Get.back();
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
