import 'package:akash/app/data/models/product.dart';
import 'package:akash/app/data/repositories/cart_repository.dart';
import 'package:akash/app/data/services/toast_service.dart';
import 'package:get/get.dart';

class CartProductController extends GetxController {
  final Product product;
  CartProductController({required this.product});

  late RxInt cartQuantity;

  bool get canAdd =>
      cartQuantity.value < product.maxCartLimit &&
      cartQuantity.value < product.stock!;

  bool get canSubtract => cartQuantity.value > product.minCartLimit;

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
    if (newQuantity == 0 || newQuantity < product.minCartLimit) {
      await repository.removeProduct(product.id!);
      return;
    }
    await repository.updateProduct(product.id!, newQuantity);
    if(newQuantity==product.minCartLimit){
      Get.find<ToastService>().showAlertMessage("Min limit reached");
    }
    if (newQuantity == product.maxCartLimit) {
      Get.find<ToastService>().showAlertMessage("Max limit reached");
    }
    if (newQuantity == product.stock) {
      Get.find<ToastService>().showAlertMessage("Stock limit reached");
    }
  }

  onRemove() async {
    await Get.find<CartRepository>().removeProduct(product.id!);
  }
}
