import 'package:flutter/cupertino.dart';
import 'package:iconly/iconly.dart';

enum AddressType { home, work, hotel, other }

extension AddressTypeExtension on AddressType {
  String get name {
    switch (this) {
      case AddressType.home:
        return "Home";
      case AddressType.work:
        return "Work";
      case AddressType.hotel:
        return "Hotel";
      case AddressType.other:
        return "Other";
      default:
        return "Other";
    }
  }

  static String getTitle(AddressType? type) {
    switch (type) {
      case AddressType.home:
        return "Home";
      case AddressType.work:
        return "Work";
      case AddressType.hotel:
        return "Hotel";
      case AddressType.other:
        return "Other";
      default:
        return "Other";
    }
  }

  static IconData getIconData(AddressType? type) {
    switch (type) {
      case AddressType.home:
        return IconlyLight.home;
      case AddressType.work:
        return IconlyLight.work;
      case AddressType.hotel:
        return CupertinoIcons.bed_double;
      case AddressType.other:
        return IconlyLight.location;
      default:
        return IconlyLight.location;
    }
  }

  static AddressType fromString(String? type) {
    switch (type) {
      case "Home":
        return AddressType.home;
      case "Work":
        return AddressType.work;
      case "Hotel":
        return AddressType.hotel;
      case "Other":
        return AddressType.other;
      default:
        return AddressType.other;
    }
  }
}
