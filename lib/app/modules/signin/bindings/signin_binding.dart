import 'package:get/get.dart';

import 'package:akash/app/modules/signin/controllers/email_signin_controller.dart';
import 'package:akash/app/modules/signin/controllers/otp_signin_controller.dart';

import '../controllers/contact_number_signin_controller.dart';

class SigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpSigninController>(
      () => OtpSigninController(),
    );
    Get.lazyPut<EmailSigninController>(
      () => EmailSigninController(),
    );
    Get.lazyPut<ContactNumberSigninController>(
      () => ContactNumberSigninController(),
    );
  }
}
