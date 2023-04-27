import 'package:akash/app/data/models/address.dart';
import 'package:akash/app/data/repositories/address_repository.dart';
import 'package:akash/app/data/services/auth_service.dart';
import 'package:akash/app/data/services/toast_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddressFormController extends GetxController {
  late Rx<Address> address;
  late GlobalKey<FormState> formKey;
  late RxBool isLoading;
  late bool exists = Get.arguments != null;

  @override
  void onInit() {
    final authService = Get.find<AuthService>();
    isLoading = false.obs;
    address = Rx(Get.arguments ??
        Address(
          name: authService.currentUser.value?.name,
          contactNumber: authService.currentUser.value?.contactNumber,
        ));
    formKey = GlobalKey<FormState>();
    super.onInit();
  }

  void submit() async {
    try {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        isLoading.value = true;
        if (exists) {
          await Get.find<AddressRepository>().updateAddress(address.value);
        } else {
          await Get.find<AddressRepository>().addAddress(address.value);
        }
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
