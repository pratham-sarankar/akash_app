import 'package:akash/app/widgets/auth_lottie_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: "company-logo",
          child: Image.asset(
            "assets/company_logo.png",
            width: 100,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Hero(
                    tag: "title",
                    child: Text(
                      "Reset",
                      style: context.textTheme.displaySmall,
                    ),
                  ),
                  Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }
                              // Check if the input is an email address
                              final emailRegex =
                                  RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                              if (emailRegex.hasMatch(value)) {
                                return null;
                              }
                              // Check if the input is a phone number
                              final phoneRegex = RegExp(
                                  r'^\+[1-9]\d{0,2}[ ]?\d{3}[ ]?\d{3}[ ]?\d{4}$');
                              if (phoneRegex.hasMatch(value)) {
                                return null;
                              }
                              // If the input is not an email address or phone number, return an error message
                              return 'Please enter a valid email address or phone number';
                            },
                            onSaved: (newValue) {
                              controller.identity = newValue;
                            },
                            decoration: const InputDecoration(
                              labelText: "Identity",
                              hintText: "Email / Phone",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 15),
                    child: TextButton(
                      onPressed: controller.resetPassword,
                      child: Obx(
                        () => controller.isLoading.value
                            ? const CupertinoActivityIndicator(
                                color: Colors.white)
                            : const Text("Proceed"),
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.1),
                ],
              ),
            ),
          ),
          const AuthLottieAnimation(),
        ],
      ),
    );
  }
}
