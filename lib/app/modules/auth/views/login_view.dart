import 'package:akash/app/modules/auth/controllers/auth_controller.dart';
import 'package:akash/app/routes/app_pages.dart';
import 'package:akash/app/widgets/auth_lottie_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: TextField(
                    // controller: controller.phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: "Enter your phone",
                      hintText: "+91 97133-12345",
                    ),
                    autofocus: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 15),
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.OTP);
                    },
                    child: const Text("Proceed"),
                  ),
                ),
                Wrap(
                  children: [
                    const Text("Don't have an account? "),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.REGISTER);
                      },
                      child: const Text("Sign Up"),
                    ),
                  ],
                ),
                SizedBox(height: Get.height*0.1),
              ],
            ),
          ),
          const AuthLottieAnimation(),
        ],
      ),
    );
  }
}
