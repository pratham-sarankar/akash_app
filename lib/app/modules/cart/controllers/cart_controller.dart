import 'package:akash/app/data/models/address.dart';
import 'package:akash/app/data/models/cart_product.dart';
import 'package:akash/app/data/models/cart_summary.dart';
import 'package:akash/app/data/repositories/cart_repository.dart';
import 'package:akash/app/data/services/toast_service.dart';
import 'package:akash/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CartController extends GetxController with StateMixin<List<CartProduct>> {
  int get totalCount => state?.length ?? 0;
  late Rx<CartSummary> summary;
  late RxBool isCheckingOut;

  @override
  void onInit() {
    isCheckingOut = false.obs;
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

  void checkout() async {
    //Setting is Checking out to true
    isCheckingOut.value = true;
    final repository = Get.find<CartRepository>();
    var address = await Get.toNamed(Routes.CHECKOUT_ADDRESS);
    if (address is! Address || address == null) return;
    final configuration = await repository.checkout(Address(id: address.id));

    final razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
    razorpay.open(configuration);
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) async {
    print(
        "Payment Successful : \nOrder Id : ${response.orderId}\nPayment Id : ${response.paymentId}");


    final repository = Get.find<CartRepository>();

    //Verify the payment with backend.
    final orderId = response.orderId;
    final paymentId = response.paymentId;
    var isVerified = await repository.verifyPayment(orderId!, paymentId!);

    if (!isVerified) {
      Get.find<ToastService>().showErrorMessage("Payment Failed");
      return;
    }

    //Updating the cart products.
    repository.clear();

    //Set the isCheckingOut to false.
    isCheckingOut.value = false;

    //Navigate to order page.
    Get.toNamed(Routes.ORDERS);
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    //Set loading = false;
    isCheckingOut.value = false;
    print("Payment Failed");
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




void handleExternalWalletSelected(ExternalWalletResponse response) {
  print("External Wallet Selected");
}
