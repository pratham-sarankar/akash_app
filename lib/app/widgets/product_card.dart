import 'package:akash/app/data/models/image.dart';
import 'package:akash/app/data/models/product.dart';
import 'package:akash/app/modules/cart/controllers/cart_product_controller.dart';
import 'package:akash/app/modules/wishlist/controllers/wishlist_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    final cartProductController = Get.put<CartProductController>(
      CartProductController(product: product),
      tag: product.id.toString(),
    );
    final wishlistProductController = Get.put<WishlistProductController>(
      WishlistProductController(product: product),
      tag: product.id.toString(),
    );
    return Container(
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        border: Border.all(
            color: context.theme.colorScheme.onBackground.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            Expanded(
              child: product.hasStock
                  ? imagesWidget()
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          color: context.theme.colorScheme.onBackground
                              .withOpacity(0.1),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Out of Stock",
                                style: context.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Opacity(
                          opacity: 0.3,
                          child: Image.asset(
                            "assets/default_product.png",
                          ),
                        ),
                      ],
                    ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 12),
                            child: Text(
                              product.name ?? "",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12, top: 5),
                            child: Text(
                              product.company ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: IconButton(
                        onPressed: wishlistProductController.addOrRemove,
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.grey.shade100),
                          shape:
                              MaterialStateProperty.all(const CircleBorder()),
                        ),
                        icon: Obx(
                          () => Icon(
                            wishlistProductController.isWishlisted.value
                                ? IconlyBold.heart
                                : IconlyLight.heart,
                            color: context.theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, top: 5),
                  child: Row(
                    children: [
                      const Text(
                        '₹',
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      Text(
                        (product.saleRate ?? 0).toString(),
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      if ((product.mrp ?? 0) > (product.saleRate ?? 0))
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            '₹${product.mrp}',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey.shade700,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ),
                      const Spacer(),
                      if (product.hasStock)
                        Obx(() {
                          if (cartProductController.cartQuantity > 0) {
                            return Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    final newQuantity = cartProductController
                                            .cartQuantity.value -
                                        1;
                                    cartProductController
                                        .onUpdateQuantity(newQuantity);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: context.theme.colorScheme.primary,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    child: const Text("-"),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 4,
                                  ),
                                  child: Text(
                                    (cartProductController.cartQuantity.value)
                                        .toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (!cartProductController.canAdd) return;
                                    final newQuantity = cartProductController
                                            .cartQuantity.value +
                                        1;
                                    cartProductController
                                        .onUpdateQuantity(newQuantity);
                                  },
                                  child: Opacity(
                                    opacity:
                                        cartProductController.canAdd ? 1 : 0.5,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:
                                            context.theme.colorScheme.primary,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      child: const Text("+"),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return GestureDetector(
                              onTap: cartProductController.onAddToCart,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: context.theme.colorScheme.primary,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 4,
                                ),
                                child: const Text("Add"),
                              ),
                            );
                          }
                        }),
                      const SizedBox(width: 12),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget imagesWidget() {
    if (product.images.isEmpty) {
      return Image.asset(
        "assets/default_product.png",
      );
    }
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15, right: 5, left: 5),
      child: Image.network(
        ProductImage.url,
        headers: {
          "key": product.images.first.imageKey,
        },
      ),
    );
  }
}
