import 'package:akash/app/data/models/address.dart';
import 'package:akash/app/data/repositories/address_repository.dart';
import 'package:akash/app/routes/app_pages.dart';
import 'package:get/get.dart';

class AddressesController extends GetxController with StateMixin<List<Address>> {
  late RxList<Address> addresses;

  @override
  void onInit() {
    addresses = RxList<Address>([]);
    super.onInit();
  }

  void initialize() async {
    List<Address> result = await Get.find<AddressRepository>().getAddresses();
    addresses.value = result;
  }

  @override
  void onReady() {
    initialize();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void add() async {
    await Get.toNamed(Routes.ADDRESS_FORM);
    initialize();
  }

  void edit(Address address) async {
    await Get.toNamed(
      Routes.ADDRESS_FORM,
      arguments: address,
    );
    initialize();
  }

  void delete(Address address)async {
    await Get.find<AddressRepository>().removeAddress(address.id!);
    initialize();
  }
}
