import 'package:akash/app/data/models/wishlist_product.dart';
import 'package:akash/app/modules/wishlist/controllers/wishlist_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class WishlistTile extends StatelessWidget {
  const WishlistTile({Key? key, required this.wishlistProduct})
      : super(key: key);
  final WishlistProduct wishlistProduct;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<WishlistProductController>(
      WishlistProductController(product: wishlistProduct.product!),
      tag: wishlistProduct.productId.toString(),
    );
    return Container(
      margin: const EdgeInsets.only(right: 10, left: 10, bottom: 15),
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        border: Border.all(
            color: context.theme.colorScheme.onBackground.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset("assets/default_product.png", width: 100),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height:15),
                Text(
                  controller.product.name!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(controller.product.company!),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text("₹${controller.product.saleRate}"),
                    const SizedBox(width: 5),
                    Text(
                      "₹${controller.product.mrp}",
                      style: context.textTheme.bodyMedium?.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: context.theme.colorScheme.onBackground
                            .withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height:10),
              ],
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {
              Get.dialog(
                AlertDialog(
                  title: const Text("Alert"),
                  content: const Text("Are you sure you want to remove this item from wishlist?"),
                  titlePadding: const EdgeInsets.only(right: 18, left: 18, top: 20),
                  contentPadding: const EdgeInsets.only(right: 18, left: 18, top: 10),
                  actionsPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Get.context!.theme.scaffoldBackgroundColor,
                  surfaceTintColor: Get.context!.theme.scaffoldBackgroundColor,
                  actions: [
                    TextButton(
                      onPressed: () async {
                        Get.back();
                        controller.remove();
                      },
                      child: const Text("Yes"),
                    ),
                  ],
                ),
              );
            },
            icon: Icon(
              IconlyLight.delete,
              color: context.theme.colorScheme.error,
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
