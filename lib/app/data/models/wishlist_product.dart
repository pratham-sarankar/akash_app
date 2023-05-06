import 'package:akash/app/data/models/product.dart';
import 'package:akash/app/interfaces/model.dart';

class WishlistProduct extends Model{
  WishlistProduct({
    super.id,
    this.productId,
    this.userId,
    this.createdAt,
    this.product,
  });

  int? productId;
  int? userId;
  DateTime? createdAt;
  Product? product;

  @override
  String? get name => product?.name;


  factory WishlistProduct.fromMap(Map<String, dynamic> json) => WishlistProduct(
    id: json["id"],
    productId: json["productId"],
    userId: json["userId"],
    createdAt: DateTime.parse(json["createdAt"]),
    product: Product.fromMap(json["product"]),
  );

  @override
  Map<String, dynamic> toMap() => {
    "id": id,
    "productId": productId,
    "userId": userId,
    "createdAt": createdAt?.toIso8601String(),
  };
}