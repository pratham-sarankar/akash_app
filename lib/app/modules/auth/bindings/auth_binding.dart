import 'package:get/get.dart';

import 'package:akash/app/modules/auth/controllers/login_controller.dart';
import 'package:akash/app/modules/auth/controllers/otp_controller.dart';
import 'package:akash/app/modules/auth/controllers/register_controller.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpController>(
      () => OtpController(),
    );
    Get.lazyPut<RegisterController>(
      () => RegisterController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
  }
}
