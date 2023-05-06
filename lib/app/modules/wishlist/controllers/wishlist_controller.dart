import 'package:akash/app/data/models/wishlist_product.dart';
import 'package:akash/app/data/repositories/wishlist_repository.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController
    with StateMixin<List<WishlistProduct>> {
  int get totalCount => state?.length ?? 0;

  @override
  void onInit() {
    _initialize();
    _addListener();
    super.onInit();
  }

  void _initialize() {
    final controller = Get.find<WishlistRepository>();
    final wishlistProducts = controller.wishlistProducts;
    final status =
        wishlistProducts.isEmpty ? RxStatus.empty() : RxStatus.success();
    change(wishlistProducts, status: status);
  }

  void _addListener() {
    final controller = Get.find<WishlistRepository>();
    ever(controller.wishlistProducts, (wishlistProducts) {
      final status =
          wishlistProducts.isEmpty ? RxStatus.empty() : RxStatus.success();
      change(wishlistProducts, status: status);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
