import 'package:akash/app/data/enums/address_type.dart';
import 'package:akash/app/data/models/address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressTile extends StatelessWidget {
  const AddressTile({
    Key? key,
    required this.onTap,
    required this.address,
  }) : super(key: key);
  final Address address;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: context.theme.colorScheme.onInverseSurface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: context.theme.colorScheme.onBackground.withOpacity(0.5),
            width: 2,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  AddressTypeExtension.getIconData(address.type),
                  size: 26,
                ),
                const SizedBox(width: 8),
                Text(
                  AddressTypeExtension.getTitle(address.type),
                  style: Get.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                if (address.isDefault)
                  Container(
                    decoration: BoxDecoration(
                      color: Get.theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 3,
                    ),
                    child: Text(
                      "Default",
                      style: Get.textTheme.titleSmall?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            if (address.name != null && address.name!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  address.name ?? "Name",
                  style: Get.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            if (address.contactNumber != null)
              Text(
                address.contactNumber!,
                style: Get.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 10),
            if (address.line1 != null)
              Text(
                address.line1!,
                style: Get.textTheme.bodyMedium?.copyWith(),
              ),
            if (address.line2 != null)
              Text(
                address.line2!,
                style: Get.textTheme.bodyMedium?.copyWith(),
              ),
          ],
        ),
      ),
    );
  }
}
