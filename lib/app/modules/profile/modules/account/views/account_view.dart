import 'package:akash/app/data/services/auth_service.dart';
import 'package:akash/app/data/services/validation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(IconlyLight.arrow_left),
        ),
      ),
      floatingActionButton: Obx(
        () => !controller.isLoading.value
            ? FloatingActionButton(
                onPressed: controller.submit,
                child: Icon(Icons.check),
              )
            : FloatingActionButton.extended(
                onPressed: () {},
                label: Text("Saving"),
                icon: CupertinoActivityIndicator(
                  color: Colors.white,
                ),
              ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Obx(
                () => CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                    Get.find<AuthService>().currentUser.value?.photoKey ??
                        "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
                  ),
                ),
              ),
              const SizedBox(height: 5),
              TextButton.icon(
                label: const Text("Change"),
                onPressed: () {
                  controller.updateProfilePicture();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.transparent,
                  ),
                  foregroundColor: MaterialStateProperty.all(
                    context.theme.colorScheme.primary,
                  ),
                ),
                icon: const Icon(IconlyLight.camera),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 25),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Username",
                        hintText: "john",
                      ),
                      onSaved: (newValue) {
                        if (newValue != null && newValue.isNotEmpty) {
                          controller.username = newValue;
                        }
                      },
                      initialValue:
                          Get.find<AuthService>().currentUser.value?.username,
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Full Name",
                        hintText: "John Doe",
                      ),
                      onSaved: (newValue) {
                        if (newValue != null && newValue.isNotEmpty) {
                          controller.displayName = newValue;
                        }
                      },
                      initialValue: Get.find<AuthService>()
                          .currentUser
                          .value
                          ?.displayName,
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: "Contact Number"),
                      validator:
                          Get.find<ValidationService>().validateContactNumber,
                      initialValue: Get.find<AuthService>()
                          .currentUser
                          .value
                          ?.contactNumber,
                      onSaved: (newValue) {
                        controller.contactNumber = newValue;
                      },
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Email",
                        hintText: "example@gmail.com",
                      ),
                      onSaved: (newValue) {
                        controller.email = newValue;
                      },
                      validator: Get.find<ValidationService>().validateEmail,
                      initialValue:
                          Get.find<AuthService>().currentUser.value?.email,
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
