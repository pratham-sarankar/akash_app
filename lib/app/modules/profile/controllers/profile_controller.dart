import 'package:akash/app/data/services/auth_service.dart';
import 'package:akash/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
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

  void logout() {
    Get.dialog(
      AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        titlePadding: const EdgeInsets.only(right: 18, left: 18, top: 20),
        contentPadding: const EdgeInsets.only(right: 18, left: 18, top: 10),
        actionsPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () async {
              var result = await Get.find<AuthService>().logout();
              if (result) {
                Get.offAllNamed(Routes.AUTH);
              }
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }
}
