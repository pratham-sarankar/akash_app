import 'package:akash/app/modules/reset_password/controllers/new_password_controller.dart';
import 'package:akash/app/widgets/auth_lottie_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class NewPasswordView extends GetView<NewPasswordController> {
  const NewPasswordView({Key? key}) : super(key: key);

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
                          child: Obx(
                            () => TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                if (value.length < 8) {
                                  return 'Password must be at least 8 characters long';
                                }
                                final hasUppercase =
                                    value.contains(RegExp(r'[A-Z]'));
                                if (!hasUppercase) {
                                  return 'Password must contain at least one uppercase letter';
                                }
                                final hasSpecialCharacters = value.contains(
                                    RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
                                if (!hasSpecialCharacters) {
                                  return 'Password must contain at least one special character';
                                }
                                return null;
                              },
                              obscureText: controller.isPasswordHidden.value,
                              onSaved: (newValue) {
                                controller.newPassword = newValue;
                              },
                              onChanged: (value) {
                                controller.newPassword = value;
                              },
                              decoration: InputDecoration(
                                labelText: "New Password",
                                hintText: "* * * * *",
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    controller.isPasswordHidden.toggle();
                                  },
                                  child: Obx(
                                    () => Icon(
                                      controller.isPasswordHidden.value
                                          ? IconlyLight.hide
                                          : IconlyLight.show,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Obx(
                            () => TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                if (value != controller.newPassword) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                controller.confirmPassword = newValue;
                              },
                              onChanged: (value) {
                                controller.confirmPassword = value;
                              },
                              obscureText:
                                  controller.isConfirmPasswordHidden.value,
                              decoration: InputDecoration(
                                labelText: "Confirm Password",
                                hintText: "* * * * *",
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    controller.isConfirmPasswordHidden.toggle();
                                  },
                                  child: Obx(
                                    () => Icon(
                                      controller.isConfirmPasswordHidden.value
                                          ? IconlyLight.hide
                                          : IconlyLight.show,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
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
