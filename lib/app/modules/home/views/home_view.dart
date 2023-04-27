import 'package:akash/app/modules/cart/controllers/cart_controller.dart';
import 'package:akash/app/modules/cart/views/cart_view.dart';
import 'package:akash/app/modules/home/views/home_tab_view.dart';
import 'package:akash/app/modules/profile/controllers/profile_controller.dart';
import 'package:akash/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(IconlyBroken.home),
              activeIcon: Icon(IconlyLight.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyBroken.bag),
              activeIcon: Icon(IconlyLight.bag),
              label: "Grocery Bag",
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyBroken.profile),
              activeIcon: Icon(IconlyLight.profile),
              label: "Profile",
            ),
          ],
          onTap: controller.changeIndex,
          currentIndex: controller.index.value,
        ),
        body: IndexedStack(
          index: controller.index.value,
          children: [
            const HomeTabView(),
            GetBuilder<CartController>(
              init: CartController(),
              builder: (_) => const CartView(),
            ),
            GetBuilder<ProfileController>(
              init: ProfileController(),
              builder: (_) => const ProfileView(),
            ),
          ],
        ),
      );
    });
  }
}
