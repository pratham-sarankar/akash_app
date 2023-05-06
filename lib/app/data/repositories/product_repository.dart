import 'package:akash/app/data/models/product.dart';
import 'package:akash/app/interfaces/repository.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import '../services/auth_service.dart';

class ProductRepository extends Repository<Product> {
  ProductRepository() : super(path: '/products');

  @override
  Future<Request> authenticator(Request request) async {
    String? accessToken = Get.find<AuthService>().getAccessToken();
    request.headers.addAll({
      'Authorization': 'Bearer $accessToken',
    });
    return request;
  }

  Future<List<Product>> fetchTopProducts({
    int page = 1,
    int limit = 10,
  }) async {
    Response response = await get('/top?page=$page&limit=$limit');
    final products = response.body?['data']?['products'];
    if (products == null) {
      return [];
    }
    return products.map<Product>((product) => converter(product)).toList();
  }

  @override
  Product converter(Map<String, dynamic> map) {
    return Product.fromMap(map);
  }

  Future<List<Product>> search(String query,{int page = 1,int limit = 10}) async{
    Response response = await get("/search?q=$query&limit=$limit&page=$page");
    final products = response.body?['data']?['products'];
    if (products == null) {
      return [];
    }
    return products.map<Product>((product) => converter(product)).toList();
  }
}
