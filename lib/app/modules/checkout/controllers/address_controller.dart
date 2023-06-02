import 'package:akash/app/data/models/address.dart';
import 'package:akash/app/data/repositories/address_repository.dart';
import 'package:akash/app/routes/app_pages.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  late RxList<Address> addresses;
  late Rx<Address?> selectedAddress;

  @override
  void onInit() {
    addresses = RxList<Address>([]);
    super.onInit();
  }

  void initialize() async {
    List<Address> result = await Get.find<AddressRepository>().getAddresses();
    addresses.value = result;

    var selectedOne =
        addresses.firstWhere((element) => element.isDefault, orElse: () {
      if (addresses.isEmpty) {
        return Address();
      }
      return addresses.first;
    });
    selectedAddress = Rx<Address?>(selectedOne.id == null ? null : selectedOne);
  }

  bool isSelected(Address address) {
    return selectedAddress.value?.id == address.id;
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

  void select(Address address) async {
    selectedAddress.value = address;
  }

  void delete(Address address) async {
    await Get.find<AddressRepository>().removeAddress(address.id!);
    initialize();
  }
}
