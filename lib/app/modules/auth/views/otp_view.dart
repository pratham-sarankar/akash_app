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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text("Verification code",style: context.textTheme.titleLarge),
              const SizedBox(height:10),
              Text("We have send the code verification \nto +919893333654",style:  context.textTheme.bodyMedium,textAlign: TextAlign.center,),
            ],
          ),

          const SizedBox(
            height: 30,
          ),

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
          const SizedBox(
            height: 30,
          ),
          const Text("Resend code after"),
          const SizedBox(height: 30),
          TextButton(
            onPressed: () {},
            child: const Text("Proceed"),
          ),
          SizedBox(height: Get.height * 0.1),
          const AuthLottieAnimation()
        ],
      ),
    );
  }
}
