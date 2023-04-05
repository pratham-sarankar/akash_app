import 'package:akash/app/widgets/login_lottie_animation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // LoginLottiesWidget(),
          Text("Login"),
          Lottie.network(
              'https://assets8.lottiefiles.com/packages/lf20_6YCRFI.json'),
        ],
      ),
    );
  }
}
