import 'package:akash/app/data/models/cart_product.dart';
import 'package:akash/app/data/models/cart_summary.dart';
import 'package:akash/app/data/models/product.dart';
import 'package:akash/app/interfaces/repository.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import '../services/auth_service.dart';

class CartRepository extends Repository<CartProduct> {
  CartRepository() : super(path: '/cart/me');

  late RxList<CartProduct> cartProducts;

  @override
  void onInit() {
    super.onInit();
    cartProducts = <CartProduct>[].obs;
    _updateProducts();
  }

  void _updateProducts() async {
    final result = await fetchAll();
    cartProducts.value = result;
  }

  bool existsProduct(Product product) {
    final availableProductIds = cartProducts.map((e) => e.product.id).toList();
    if (availableProductIds.contains(product.id)) {
      return true;
    }
    return false;
  }

  CartProduct? getCartProduct(Product product) {
    final availableProductIds = cartProducts.map((e) => e.product.id).toList();
    if (availableProductIds.contains(product.id)) {
      return cartProducts.firstWhere((e) => e.product.id == product.id);
    }
    return null;
  }

  int? getCartProductQuantity(Product product) {
    final cartProduct = getCartProduct(product);
    return cartProduct?.quantity;
  }

  @override
  Future<Request> authenticator(Request request) async {
    String? accessToken = Get.find<AuthService>().getAccessToken();
    request.headers.addAll({
      'Authorization': 'Bearer $accessToken',
    });
    return request;
  }

  @override
  CartProduct converter(Map<String, dynamic> map) {
    return CartProduct.fromMap(map);
  }

  Future<List<CartProduct>> fetchAll() async {
    final response = await get("/");
    final cartProducts = response.body?['data']?['cartProducts'];
    if(cartProducts==null){
      return [];
    }
    return cartProducts
        .map<CartProduct>((cartProduct) => converter(cartProduct))
        .toList();
  }

  Future<CartProduct> addProduct(int productId) async {
    final response = await post("/", {"productId": productId});
    final cartProduct = response.body?['data']?['cartProduct'];
    // When we add a product to the cart, we need to update the cartProducts list.
    var result = converter(cartProduct);
    _updateProducts();
    return result;
  }

  Future<CartProduct> updateProduct(int productId, int quantity) async {
    final response = await put("/$productId", {"quantity": quantity});
    final cartProduct = response.body?['data']?['cartProduct'];
    // When we update a product in the cart, we need to update the cartProducts list.
    var result = converter(cartProduct);
    _updateProducts();
    return result;
  }

  Future<void> removeProduct(int productId) async {
    await delete("/$productId");
    // When we delete a product from the cart, we need to update the cartProducts list.
    _updateProducts();
  }

  Future<CartSummary> getSummary()async{
    Response response = await get("/summary");
    final body = response.body?['data'];
    return CartSummary.fromMap(body);
  }
}
