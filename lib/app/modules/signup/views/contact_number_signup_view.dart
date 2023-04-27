import 'package:akash/app/data/services/validation_service.dart';
import 'package:akash/app/routes/app_pages.dart';
import 'package:akash/app/widgets/auth_lottie_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../controllers/contact_number_signup_controller.dart';

class ContactNumberSignupView extends GetView<ContactNumberSignupController> {
  const ContactNumberSignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Column(
              children: [
                Hero(
                  tag: "title",
                  child: Text(
                    "Sign Up",
                    style: context.textTheme.displaySmall,
                  ),
                ),
                Form(
                  key: controller.formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      validator:
                          Get.find<ValidationService>().validateContactNumber,
                      onSaved: (newValue) {
                        controller.contactNumber = newValue;
                      },
                      decoration: const InputDecoration(
                        labelText: "Contact Number",
                        hintText: "+91 97133-12345",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 15),
                  child: TextButton(
                    onPressed: controller.signup,
                    child: Obx(() => controller.isLoading.value
                        ? const CupertinoActivityIndicator(color: Colors.white)
                        : const Text("Proceed")),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.EMAIL_SIGNUP);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign up with email",
                        style: TextStyle(
                          color: context.theme.colorScheme.primary,
                          fontWeight: FontWeight.w600,
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
                SizedBox(height: Get.height * 0.1),
              ],
            ),
          ),
          const AuthLottieAnimation(),
        ],
      ),
    );
  }
}
