import 'package:akash/app/data/models/product.dart';
import 'package:akash/app/data/repositories/product_repository.dart';
import 'package:get/get.dart';

class HomeTabController extends GetxController {
  late RxList<Product> topProducts;

  @override
  void onInit() {
    topProducts = <Product>[].obs;
    super.onInit();
  }

  fetchTopProducts() async {
    final products = await Get.find<ProductRepository>().fetchTopProducts();
    topProducts.value = products;
  }

  @override
  void onReady() {
    fetchTopProducts();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
