import 'package:akash/app/data/models/cart_product.dart';
import 'package:akash/app/data/models/cart_summary.dart';
import 'package:akash/app/data/repositories/cart_repository.dart';
import 'package:get/get.dart';

class CartController extends GetxController with StateMixin<List<CartProduct>> {
  int get totalCount => state?.length ?? 0;
  late Rx<CartSummary> summary;

  @override
  void onInit() {
    summary = CartSummary(
      totalProducts: 0,
      subTotal: 0,
      deliveryCharge: 0,
      discountedTotal: 0,
      orderTotal: 0,
    ).obs;
    _initialize();
    _addListener();
    super.onInit();
  }

  void _initialize() async {
    //Initialize the products
    final controller = Get.find<CartRepository>();
    final cartProducts = controller.cartProducts;
    final status = cartProducts.isEmpty ? RxStatus.empty() : RxStatus.success();
    change(cartProducts, status: status);

    //Initialize Summary.
    var cartSummary = await controller.getSummary();
    summary.value = cartSummary;
  }

  void _addListener() {
    final controller = Get.find<CartRepository>();
    try {
      ever(controller.cartProducts, (cartProducts) async {
        //Update the products
        final status =
            cartProducts.isEmpty ? RxStatus.empty() : RxStatus.success();
        change(cartProducts, status: status);

        //Update summary.
        var cartSummary = await controller.getSummary();
        summary.value = cartSummary;
      });
    } catch (e, s) {
      print(s);
    }
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
