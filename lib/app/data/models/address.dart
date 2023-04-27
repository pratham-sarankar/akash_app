import 'package:akash/app/data/enums/address_type.dart';
import 'package:akash/app/interfaces/model.dart';

class Address extends Model {
  String? contactNumber;
  String? line1;
  String? line2;
  String? landmark;
  String? pinCode;
  bool isDefault;
  AddressType? type;

  Address({
    this.contactNumber,
    this.line1,
    this.line2,
    this.landmark,
    this.pinCode,
    this.isDefault = false,
    this.type,
    super.name,
    super.id,
  });

  Address.fromMap(Map<String, dynamic> map)
      : contactNumber = map['contactNumber'],
        line1 = map['line1'],
        line2 = map['line2'],
        landmark = map['landmark'],
        pinCode = map['pinCode'],
        isDefault = map['isDefault'] ?? false,
        type = map['type'] != null
            ? AddressTypeExtension.fromString(map['type'])
            : null,
        super(id: map['id'], name: map['name']);

  Address copyWith({
    int? id,
    String? name,
    String? contactNumber,
    String? line1,
    String? line2,
    String? landmark,
    String? pinCode,
    bool? isDefault,
    AddressType? type,
  }) {
    return Address(
      id: id ?? this.id,
      name: name ?? this.name,
      contactNumber: contactNumber ?? this.contactNumber,
      line1: line1 ?? this.line1,
      line2: line2 ?? this.line2,
      landmark: landmark ?? this.landmark,
      pinCode: pinCode ?? this.pinCode,
      isDefault: isDefault ?? this.isDefault,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "contactNumber": contactNumber,
      "line1": line1,
      "line2": line2,
      "landmark": landmark,
      "pinCode": pinCode,
      "isDefault": isDefault,
      "type": type?.name,
    };
  }
}
