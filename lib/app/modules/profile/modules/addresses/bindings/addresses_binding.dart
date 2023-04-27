import 'package:akash/app/modules/profile/modules/addresses/controllers/address_form_controller.dart';
import 'package:get/get.dart';

import '../controllers/addresses_controller.dart';

class AddressesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressFormController>(
      () => AddressFormController(),
    );
    Get.lazyPut<AddressesController>(
      () => AddressesController(),
    );
  }
}
