import 'package:akash/app/modules/checkout/controllers/address_controller.dart';
import 'package:akash/app/modules/profile/modules/account/widgets/add_address_buttton.dart';
import 'package:akash/app/modules/profile/modules/account/widgets/address_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends GetView<AddressController> {
  const AddressView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Address'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            AddAddressButton(
              onTap: controller.add,
            ),
            const SizedBox(height: 16),
            Obx(
              () => ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  for (var address in controller.addresses)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: AddressTile(
                        address: address,
                        onTap: () {
                          controller.select(address);
                        },
                        onDelete: () {
                          Get.back();
                          controller.delete(address);
                        },
                        isSelected:
                            controller.isSelected(address),
                      ),
                    ),
                ],
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Continue"),
              onPressed: () {
                Get.back(result: controller.selectedAddress.value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
