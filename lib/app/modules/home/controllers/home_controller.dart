import 'package:get/get.dart';

class HomeController extends GetxController {
  late RxInt index = 0.obs;


  void changeIndex(int index) {
    this.index.value = index;
  }

  @override
  void onInit() {
    index = 0.obs;
    super.onInit();
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
