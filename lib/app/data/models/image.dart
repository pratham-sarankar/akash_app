import 'package:flutter_dotenv/flutter_dotenv.dart';

class ProductImage{
  final int id;
  final int productId;
  final String imageKey;

  ProductImage({
    required this.id,
    required this.productId,
    required this.imageKey,
  });

  factory ProductImage.fromMap(Map<String, dynamic> map) {
    return ProductImage(
      id: map['id'],
      productId: map['productId'],
      imageKey: map['imageKey'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "productId": productId,
      "imageKey": imageKey,
    };
  }

  static String url ='${dotenv.env['HOST']}/images/stream?time=${DateTime.now().millisecondsSinceEpoch}';

}