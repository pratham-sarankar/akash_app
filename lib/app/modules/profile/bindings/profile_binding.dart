import 'package:get/get.dart';

import 'package:akash/app/modules/profile/controllers/change_password_controller.dart';
import 'package:akash/app/modules/profile/controllers/security_controller.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePasswordController>(
      () => ChangePasswordController(),
    );
    Get.lazyPut<SecurityController>(
      () => SecurityController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
