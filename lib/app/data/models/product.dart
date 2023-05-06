import 'package:akash/app/interfaces/model.dart';

class Product extends Model {
  String? code;
  String? catcode;
  int? stock;
  String? remark;
  String? company;
  num? mrp;
  num? saleRate;
  num? purchaseRate;
  num? deal;
  num? free;

  Product({
    super.id,
    super.name,
    this.code,
    this.catcode,
    this.stock,
    this.remark,
    this.company,
    this.mrp,
    this.saleRate,
    this.purchaseRate,
    this.deal,
    this.free,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      code: map['code'],
      catcode: map['catcode'],
      stock: map['stock'],
      remark: map['remark'],
      company: map['company'],
      mrp: map['mrp'],
      saleRate: map['saleRate'],
      purchaseRate: map['purchaseRate'],
      deal: map['deal'],
      free: map['free'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "catcode": catcode,
      "code": code,
      "name": name,
      "stock": stock,
      "remark": remark,
      "company": company,
      "mrp": mrp,
      "saleRate": saleRate,
      "deal": deal,
      "free": free,
      "purchaseRate": purchaseRate
    };
  }
}
