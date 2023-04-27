import 'package:akash/app/modules/reset_password/controllers/success_reset_password_controller.dart';
import 'package:akash/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';

class SuccessResetPasswordView extends GetView<SuccessResetPasswordController> {
  const SuccessResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Congratulations!",
              style: Get.textTheme.headlineLarge,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Your password has been reset successfully. You can now sign in with your new password.",
                textAlign: TextAlign.center,
                style: Get.textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Get.offAllNamed(Routes.CONTACT_NUMBER_SIGNIN);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign in",
                    style: Get.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: context.theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Icon(
                    IconlyLight.arrow_right,
                    size: 15,
                    color: context.theme.colorScheme.primary,
                  ),
                ],
              ),
            ),
            //TODO: Convert This to asset lottie
            Lottie.asset(
              "assets/lotties/password_reset_success_lottie.json",
              repeat: false,
            ),
          ],
        ),
      ),
    );
  }
}
