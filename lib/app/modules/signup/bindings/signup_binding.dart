import 'package:get/get.dart';

import 'package:akash/app/modules/signup/controllers/email_signup_controller.dart';
import 'package:akash/app/modules/signup/controllers/otp_signup_controller.dart';

import '../controllers/contact_number_signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpSignupController>(
      () => OtpSignupController(),
    );
    Get.lazyPut<EmailSignupController>(
      () => EmailSignupController(),
    );
    Get.lazyPut<ContactNumberSignupController>(
      () => ContactNumberSignupController(),
    );
  }
}
