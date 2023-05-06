import 'package:akash/app/data/models/product.dart';
import 'package:akash/app/data/repositories/product_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchController extends GetxController with StateMixin<List<Product>> {
  late final TextEditingController controller;

  @override
  void onInit() {
    controller = TextEditingController();
    controller.addListener(() {
      fetchProducts();
    });
    super.onInit();
  }

  void fetchProducts() async {
    change([], status: RxStatus.loading());
    final products = await Get.find<ProductRepository>().search(controller.text);
    change(products,
        status: products.isEmpty ? RxStatus.empty() : RxStatus.success());
  }

  @override
  void onReady() {
    fetchProducts();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
