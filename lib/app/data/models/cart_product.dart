import 'package:akash/app/data/models/product.dart';
import 'package:akash/app/interfaces/model.dart';

class CartProduct extends Model {
  final int userId;
  final int productId;
  final int? quantity;
  final Product product;

  CartProduct({
    super.id,
    required this.userId,
    required this.productId,
    this.quantity,
    required this.product,
  });

  factory CartProduct.fromMap(Map<String, dynamic> map) {
    return CartProduct(
      id: map['id'],
      userId: map['userId'],
      productId: map['productId'],
      quantity: map['quantity'],
      product: Product.fromMap(map['product']),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "userId": userId,
      "productId": productId,
      "quantity": quantity,
      "product": product.toMap(),
    };
  }

  //== operator must be override to compare two objects
  //For example, when you use List.contains() method to check if the list contains a specific object, it will use == operator to check if two objects are the same.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartProduct &&
          runtimeType == other.runtimeType && productId == other.productId;

  @override
  int get hashCode => productId.hashCode;

  @override
  String? get name => product.name;

  @override
  String toString() {
    return "CartProduct{id: $id, name:$name, quantity:$quantity}";
  }
}
