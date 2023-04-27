import 'package:akash/app/modules/signin/controllers/email_signin_controller.dart';
import 'package:akash/app/routes/app_pages.dart';
import 'package:akash/app/widgets/auth_lottie_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class EmailSigninView extends GetView<EmailSigninController> {
  const EmailSigninView({Key? key}) : super(key: key);

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
                      "Login",
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email is required';
                              }
                              if (!RegExp(
                                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                                  .hasMatch(value)) {
                                return 'Invalid email format';
                              }
                              return null;
                            },
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
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.RESET_PASSWORD);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Reset Password",
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
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 15),
                    child: TextButton(
                      onPressed: controller.login,
                      child: Obx(
                        () => controller.isLoading.value
                            ? const CupertinoActivityIndicator(
                                color: Colors.white)
                            : const Text("Login"),
                      ),
                    ),
                  ),
                  Wrap(
                    children: [
                      const Text("Don't have an account? "),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.SIGNUP);
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: context.theme.colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
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
