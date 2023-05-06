import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Old Password",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters long';
                  }
                  final hasUppercase = value.contains(RegExp(r'[A-Z]'));
                  if (!hasUppercase) {
                    return 'Password must contain at least one uppercase letter';
                  }
                  final hasSpecialCharacters =
                      value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
                  if (!hasSpecialCharacters) {
                    return 'Password must contain at least one special character';
                  }
                  return null;
                },
                autofocus: true,
                onSaved: (newValue) {
                  controller.oldPassword = newValue;
                },
              ),
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
                      final hasUppercase = value.contains(RegExp(r'[A-Z]'));
                      if (!hasUppercase) {
                        return 'Password must contain at least one uppercase letter';
                      }
                      final hasSpecialCharacters =
                          value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
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
                    obscureText: controller.isConfirmPasswordHidden.value,
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.changePassword,
        child: const Icon(Icons.check),
      ),
    );
  }
}
