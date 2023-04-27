import 'package:get/get.dart';

import 'package:akash/app/modules/home/controllers/home_tab_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeTabController>(
      () => HomeTabController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
