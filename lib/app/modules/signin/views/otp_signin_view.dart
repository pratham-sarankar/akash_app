import 'package:akash/app/modules/signin/controllers/otp_signin_controller.dart';
import 'package:akash/app/widgets/auth_lottie_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class OtpSigninView extends GetView<OtpSigninController> {
  const OtpSigninView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text("Verification code", style: context.textTheme.titleLarge),
              const SizedBox(height: 10),
              Text(
                "We have send the code verification \nto ${controller.sentTo}",
                style: context.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          OtpTextField(
            numberOfFields: 6,
            autoFocus: true,
            showFieldAsBox: true,
            fieldWidth: 50,
            borderRadius: BorderRadius.circular(10),
            borderColor: Get.theme.colorScheme.primary,
            focusedBorderColor: Get.theme.colorScheme.primary,
            borderWidth: 2,
            onSubmit: (value) {
              controller.otp = value;
            },
            // onSubmit: (value) {},
          ),
          const SizedBox(
            height: 30,
          ),
          Obx(() {
            if (controller.canResend.value) {
              return GestureDetector(
                onTap: controller.resend,
                child: Text(
                  "Resend code",
                  style: Get.textTheme.bodyLarge?.copyWith(
                    color: Get.theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Resend code after",
                  style: Get.textTheme.bodyMedium,
                ),
                const SizedBox(width: 5),
                Obx(
                  () => Text(
                    controller.formattedSeconds,
                    style: Get.textTheme.bodyLarge?.copyWith(
                      color: Get.theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          }),
          const SizedBox(height: 30),
          TextButton(
            onPressed: controller.proceed,
            child: Obx(() => controller.isLoading.value
                ? const CupertinoActivityIndicator(color: Colors.white)
                : const Text("Proceed")),
          ),
          SizedBox(height: Get.height * 0.1),
          const AuthLottieAnimation(),
        ],
      ),
    );
  }
}
