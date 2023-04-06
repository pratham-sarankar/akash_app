import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:get/get.dart';

import '../../../widgets/auth_lottie_animation.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          OtpTextField(
            numberOfFields: 6,
            autoFocus: true,
            showFieldAsBox: true,
            fieldWidth: 50,
            borderRadius: BorderRadius.circular(10),
            borderColor: Get.theme.colorScheme.primary,

            focusedBorderColor: Get.theme.colorScheme.primary,
            borderWidth: 2,
            // onSubmit: (value) {},
          ),
          const SizedBox(height: 30),
          TextButton(
            onPressed: () {},
            child: const Text("Proceed"),
          ),
          SizedBox(height: Get.height*0.1),
          const AuthLottieAnimation()
        ],

      ),

    );
  }
}
