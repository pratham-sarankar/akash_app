import 'package:akash/app/data/models/product.dart';
import 'package:akash/app/data/repositories/cart_repository.dart';
import 'package:get/get.dart';

class CartProductController extends GetxController {
  final Product product;
  CartProductController({required this.product});

  late RxInt cartQuantity;

  @override
  void onInit() {
    _initializeCartQuantity();
    final repository = Get.find<CartRepository>();
    ever(repository.cartProducts, (cartProducts) {
      final cartProduct = cartProducts
          .firstWhereOrNull((element) => element.productId == product.id);
      cartQuantity.value = cartProduct?.quantity ?? 0;
    });
    super.onInit();
  }

  _initializeCartQuantity() {
    var cartProducts = Get.find<CartRepository>().cartProducts;
    var foundProduct = cartProducts
        .firstWhereOrNull((element) => element.productId == product.id);

    cartQuantity = (foundProduct?.quantity ?? 0).obs;

    final repository = Get.find<CartRepository>();
    final exists = repository.existsProduct(product);
    if (!exists) return;

    final quantity = repository.getCartProductQuantity(product);
    cartQuantity = quantity?.obs ?? 0.obs;
  }

  onAddToCart() async {
    await Get.find<CartRepository>().addProduct(product.id!);
  }


  onUpdateQuantity(int newQuantity) async {
    final repository = Get.find<CartRepository>();
    if(newQuantity==0){
      await repository.removeProduct(product.id!);
      return;
    }
    await repository.updateProduct(product.id!, newQuantity);
  }
}
