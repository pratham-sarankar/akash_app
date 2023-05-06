import 'package:akash/app/modules/wishlist/widgets/wishlist_tile.dart';
import 'package:akash/app/routes/app_pages.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';

import '../controllers/wishlist_controller.dart';

class WishlistView extends GetView<WishlistController> {
  const WishlistView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
        leading: Hero(
          tag: "back_button",
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(IconlyLight.arrow_left),
          ),
        ),
      ),
      body: controller.obx(
        (state) {
          return ListView(
            padding: const EdgeInsets.only(top: 20),
            children: [
              for (var tile in state!) WishlistTile(wishlistProduct: tile),
            ],
          );
        },
        onEmpty: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: Get.height * 0.10, width: Get.width),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Lottie.asset(
                "assets/lotties/empty_illustration_lottie.json",
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  "Empty Wishlist",
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 15),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        "Your wishlist is empty. Add your \nfavourite products to your wishlist",
                    style: context.textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: " click here",
                        style: context.textTheme.titleMedium?.copyWith(
                          color: context.theme.colorScheme.primary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(Routes.SEARCH);
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
