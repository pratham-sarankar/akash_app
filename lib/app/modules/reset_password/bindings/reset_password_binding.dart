import 'package:get/get.dart';

import 'package:akash/app/modules/reset_password/controllers/new_password_controller.dart';
import 'package:akash/app/modules/reset_password/controllers/otp_reset_password_controller.dart';
import 'package:akash/app/modules/reset_password/controllers/success_reset_password_controller.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SuccessResetPasswordController>(
      () => SuccessResetPasswordController(),
    );
    Get.lazyPut<NewPasswordController>(
      () => NewPasswordController(),
    );
    Get.lazyPut<OtpResetPasswordController>(
      () => OtpResetPasswordController(),
    );
    Get.lazyPut<ResetPasswordController>(
      () => ResetPasswordController(),
    );
  }
}
