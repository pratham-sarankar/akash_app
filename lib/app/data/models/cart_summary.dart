

class CartSummary{
  final int totalProducts;
  final int subTotal;
  final int discountedTotal;
  final int deliveryCharge;
  final int orderTotal;

  CartSummary({
    required this.totalProducts,
    required this.subTotal,
    required this.discountedTotal,
    required this.deliveryCharge,
    required this.orderTotal,
  });

  factory CartSummary.fromMap(Map<String, dynamic> map) {
    return CartSummary(
      totalProducts: map['totalProducts'],
      subTotal: map['subTotal'],
      discountedTotal: map['discountedTotal'],
      deliveryCharge: map['deliveryCharge'],
      orderTotal: map['orderTotal'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "totalProducts": totalProducts,
      "subTotal": subTotal,
      "discountedTotal": discountedTotal,
      "deliveryCharge": deliveryCharge,
      "orderTotal": orderTotal,
    };
  }

}