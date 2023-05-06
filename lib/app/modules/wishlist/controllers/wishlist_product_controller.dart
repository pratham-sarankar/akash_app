import 'package:akash/app/data/models/product.dart';
import 'package:akash/app/data/repositories/wishlist_repository.dart';
import 'package:get/get.dart';

class WishlistProductController extends GetxController {
  final Product product;

  WishlistProductController({required this.product});

  late RxBool isWishlisted;

  @override
  void onInit() {
    _initializeIsWishlisted();
    final repository = Get.find<WishlistRepository>();
    ever(repository.wishlistProducts, (value) {
      final exists = repository.existsProduct(product);
      isWishlisted.value = exists;
    });
    super.onInit();
  }

  _initializeIsWishlisted() {
    final repository = Get.find<WishlistRepository>();
    final exists = repository.existsProduct(product);
    isWishlisted = exists.obs;
  }

  addOrRemove() async {
    if(isWishlisted.value){
      await Get.find<WishlistRepository>().remove(product.id!);
    }else{
      await Get.find<WishlistRepository>().add(product.id!);
    }
  }

  remove()async{
    await Get.find<WishlistRepository>().remove(product.id!);
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
