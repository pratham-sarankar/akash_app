import 'package:akash/app/data/services/validation_service.dart';
import 'package:akash/app/modules/profile/modules/addresses/controllers/address_form_controller.dart';
import 'package:akash/app/modules/profile/modules/addresses/widgets/address_type_selection_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class AddressFormView extends GetView<AddressFormController> {
  const AddressFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${controller.exists ? "Update" : "Add"} Address'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(IconlyLight.arrow_left),
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: const EdgeInsets.only(top: 20, right: 16, left: 16),
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Name",
              ),
              initialValue: controller.address.value.name,
              onSaved: (newValue) {
                controller.address.value =
                    controller.address.value.copyWith(name: newValue);
              },
            ),
            const SizedBox(height: 25),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Contact Number",
              ),
              initialValue: controller.address.value.contactNumber,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return null;
                } else {
                  return Get.find<ValidationService>()
                      .validateContactNumber(value);
                }
              },
              onSaved: (newValue) {
                controller.address.value =
                    controller.address.value.copyWith(contactNumber: newValue);
              },
            ),
            const SizedBox(height: 25),
            Obx(
              () => AddressTypeSelectionField(
                value: controller.address.value.type,
                validator: (type) {
                  if (type == null) {
                    return "Please select an address type";
                  }
                },
                onSaved: (value) {
                  controller.address.value =
                      controller.address.value.copyWith(type: value);
                },
              ),
            ),
            const SizedBox(height: 25),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Address Line 1",
                hintText: "Street Address",
              ),
              initialValue: controller.address.value.line1,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "This field is required";
                }
              },
              onSaved: (newValue) {
                controller.address.value =
                    controller.address.value.copyWith(line1: newValue);
              },
            ),
            const SizedBox(height: 25),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Address Line 2",
                hintText: "Area, Colony, Street, Sector, Village",
              ),
              initialValue: controller.address.value.line2,
              onSaved: (newValue) {
                controller.address.value =
                    controller.address.value.copyWith(line2: newValue);
              },
            ),
            const SizedBox(height: 25),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Landmark",
              ),
              initialValue: controller.address.value.landmark,
              onSaved: (newValue) {
                controller.address.value =
                    controller.address.value.copyWith(landmark: newValue);
              },
            ),
            const SizedBox(height: 25),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Pin Code",
              ),
              initialValue: controller.address.value.pinCode,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return null;
                } else {
                  return Get.find<ValidationService>().validatePinCode(value);
                }
              },
              onSaved: (newValue) {
                controller.address.value =
                    controller.address.value.copyWith(pinCode: newValue);
              },
            ),
            const SizedBox(height: 15),
            Obx(
              () => CheckboxListTile(
                value: controller.address.value.isDefault,
                onChanged: (value) {
                  controller.address.value =
                      controller.address.value.copyWith(isDefault: value!);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "Set as Default",
                  style: Get.textTheme.bodySmall?.copyWith(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: controller.submit,
              child: const Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
