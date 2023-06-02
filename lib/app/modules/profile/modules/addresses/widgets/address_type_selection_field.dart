import 'package:akash/app/data/enums/address_type.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class AddressTypeSelectionField extends StatelessWidget {
  const AddressTypeSelectionField({
    Key? key,
    this.value = AddressType.home,
    this.onSaved,
    this.validator,
  }) : super(key: key);
  final AddressType? value;
  final ValueChanged<AddressType?>? onSaved;
  final String? Function(AddressType?)? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      key: ValueKey(value),
      child: DropdownButtonFormField2<AddressType>(
        decoration: const InputDecoration(
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.zero,
          isCollapsed: true,
        ),
        onSaved: onSaved,
        validator: validator,
        hint: const Text("Select Type"),
        items: [
          for (AddressType type in AddressType.values)
            DropdownMenuItem(
              value: type,
              child: Row(
                children: [
                  Icon(
                    AddressTypeExtension.getIconData(type),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    AddressTypeExtension.getTitle(type),
                  ),
                ],
              ),
            ),
        ],
        value: value,
        onChanged: onSaved,
        buttonStyleData: ButtonStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: context.theme.inputDecorationTheme.border?.borderSide.color??Colors.grey,
            ),
          ),
          height: 55,
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        iconStyleData: const IconStyleData(
          icon: Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(
              IconlyLight.arrow_down_2,
            ),
          ),
          openMenuIcon: Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(
              IconlyLight.arrow_up_2,
            ),
          ),
          iconSize: 20,
        ),
      ),
    );
  }
}
