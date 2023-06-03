import '../../../interfaces/model.dart';

class Order extends Model {
  int? id;
  String? amount;
  String? status;
  String? razorpayOrderId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  int? addressId;

  Order({
    this.id,
    this.amount,
    this.status,
    this.razorpayOrderId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.addressId,
  });

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'],
      amount: map['amount'],
      status: map['status'],
      razorpayOrderId: map['razorpayOrderId'],
      userId: map['userId'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      addressId: map['addressId'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'status': status,
      'razorpayOrderId': razorpayOrderId,
      'userId': userId,
      'createdAt': DateTime.parse(createdAt!).toIso8601String(),
      'updatedAt': DateTime.parse(updatedAt!).toIso8601String(),
      'addressId': addressId,
    };
  }
}
