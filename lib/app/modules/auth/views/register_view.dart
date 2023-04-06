import 'package:akash/app/modules/auth/controllers/auth_controller.dart';
import 'package:akash/app/modules/auth/controllers/register_controller.dart';
import 'package:akash/app/widgets/auth_lottie_animation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Column(
              children: [
                Text(
                  "Register",
                  style: context.textTheme.headlineLarge,
                ),
                const Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: TextField(
                    // controller: controller.phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: "Name",
                      hintText: "John Doe",
                    ),
                    autofocus: true,
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: TextField(
                    // controller: controller.phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: "Contact Number",
                      hintText: "+91 97133-12345",
                    ),
                    autofocus: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 15),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Proceed"),
                  ),
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
