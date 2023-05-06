import 'package:akash/app/data/models/product.dart';
import 'package:akash/app/data/models/wishlist_product.dart';
import 'package:akash/app/data/services/auth_service.dart';
import 'package:akash/app/interfaces/repository.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class WishlistRepository extends Repository<WishlistProduct>{
  WishlistRepository() : super(path: '/wishlist/me');

  late RxList<WishlistProduct> wishlistProducts;

  @override
  void onInit() {
    super.onInit();
    wishlistProducts = <WishlistProduct>[].obs;
    _updateProducts();
  }

  void _updateProducts() async {
    final result = await fetchAll();
    wishlistProducts.value = result;
  }

  bool existsProduct(Product product) {
    final availableProductIds = wishlistProducts.map((e) => e.productId).toList();
    if (availableProductIds.contains(product.id)) {
      return true;
    }
    return false;
  }

  WishlistProduct? getWishlistProduct(Product product) {
    final availableProductIds = wishlistProducts.map((e) => e.productId).toList();
    if (availableProductIds.contains(product.id)) {
      return wishlistProducts.firstWhere((e) => e.productId == product.id);
    }
    return null;
  }

  @override
  Future<Request> authenticator(Request request)async {
    String? accessToken = Get.find<AuthService>().getAccessToken();
    request.headers.addAll({
      'Authorization': 'Bearer $accessToken',
    });
    return request;
  }

  @override
  WishlistProduct converter(Map<String, dynamic> map) {
    return WishlistProduct.fromMap(map);
  }

  Future<List<WishlistProduct>> fetchAll() async {
    final response = await get("/");
    //wishlistProducts
    final wishlistProducts = response.body?['data']?['wishlistProducts'];
    if(wishlistProducts==null){
      return [];
    }
    return wishlistProducts
        .map<WishlistProduct>((wishlistProduct) => converter(wishlistProduct))
        .toList();
  }

  Future<WishlistProduct> add(int productId) async {
    final response = await post("/", {
      "productId": productId,
    });
    final wishlistProduct = response.body?['data']?['wishlistProduct'];
    final WishlistProduct newWishlistProduct = converter(wishlistProduct);
    _updateProducts();
    return newWishlistProduct;
  }

  Future<void> remove(int productId) async {
    await delete("/$productId");
    _updateProducts();
    return;
  }
}