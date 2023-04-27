import 'package:akash/app/data/services/validation_service.dart';
import 'package:akash/app/modules/signup/controllers/email_signup_controller.dart';
import 'package:akash/app/widgets/auth_lottie_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class EmailSignupView extends GetView<EmailSignupController> {
  const EmailSignupView({Key? key}) : super(key: key);

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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
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
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator:
                                Get.find<ValidationService>().validateEmail,
                            onSaved: (newValue) {
                              controller.email = newValue;
                            },
                            decoration: const InputDecoration(
                              labelText: "Email",
                              hintText: "example@gmail.com",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Obx(
                            () => TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              onSaved: (newValue) {
                                controller.password = newValue;
                              },
                              obscureText: !controller.isPasswordVisible.value,
                              validator: Get.find<ValidationService>()
                                  .validatePassword,
                              decoration: InputDecoration(
                                labelText: "Password",
                                hintText: "********",
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    controller.toggleVisibility();
                                  },
                                  child: Obx(
                                    () => Icon(
                                      controller.isPasswordVisible.value
                                          ? IconlyLight.show
                                          : IconlyLight.hide,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 15),
                    child: TextButton(
                      onPressed: controller.login,
                      child: Obx(
                        () => controller.isLoading.value
                            ? const CupertinoActivityIndicator(
                                color: Colors.white)
                            : const Text("Sign Up"),
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
