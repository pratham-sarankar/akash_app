import 'package:akash/app/data/enums/tax_type.dart';

class Product {
  final String? id;
  String? name;
  double? salePrice;
  double? discountPrice;
  List<String>? photoList;
  double? shippingCost;
  double? tax;
  TaxType? taxType;

  // final double tax;
  final String? tag;

  //Additional Details
  final String? description;
  final double? rating;
  int? quantity;
  int? categoryId;
  int? subCategoryId;
  int? availQuantity;

  Product({
    this.id,
    this.photoList,
    this.name,
    this.salePrice,
    this.discountPrice,
    this.tag,
    this.description = '',
    this.rating = 0,
    this.categoryId = 0,
    this.subCategoryId = 0,
    this.quantity = 1,
    this.tax,
    this.taxType,
    this.availQuantity,
    this.shippingCost,
  });
}
