import 'package:akash/app/modules/profile/modules/account/widgets/add_address_buttton.dart';
import 'package:akash/app/modules/profile/modules/account/widgets/address_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../controllers/addresses_controller.dart';

class AddressesView extends GetView<AddressesController> {
  const AddressesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(IconlyLight.arrow_left),
        ),
        title: const Text('Addresses'),
      ),
      extendBodyBehindAppBar: false,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                        controller.edit(address);
                      },
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
