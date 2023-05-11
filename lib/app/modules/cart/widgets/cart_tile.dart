import 'package:akash/app/data/models/cart_product.dart';
import 'package:akash/app/modules/cart/controllers/cart_product_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartTile extends StatelessWidget {
  const CartTile({Key? key, required this.cartProduct}) : super(key: key);
  final CartProduct cartProduct;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<CartProductController>(
      CartProductController(product: cartProduct.product),
      tag: cartProduct.productId.toString(),
    );
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: context.theme.colorScheme.onBackground.withOpacity(0.1),
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      margin: const EdgeInsets.only(bottom: 15, right: 15, left: 15),
      child: Row(
        children: [
          Image.asset("assets/default_product.png", width: 100),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        controller.product.name!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        controller.onRemove();
                      },
                      child: const Icon(
                        CupertinoIcons.clear,
                        size: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                        ],
                      ),
                    ),
                    Obx(() {
                      return Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if(!controller.canSubtract)return;
                              final newQuantity =
                                  controller.cartQuantity.value - 1;
                              controller.onUpdateQuantity(newQuantity);
                            },
                            child: Opacity(
                              opacity: controller.canSubtract ? 1 : 0.5,
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
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 4,
                            ),
                            child: Text(
                              (controller.cartQuantity.value).toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (!controller.canAdd) return;
                              final newQuantity =
                                  controller.cartQuantity.value + 1;
                              controller.onUpdateQuantity(newQuantity);
                            },
                            child: Opacity(
                              opacity: controller.canAdd ? 1 : 0.5,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: context.theme.colorScheme.primary,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                child: const Text("+"),
                              ),
                            ),
                          )
                        ],
                      );
                    }),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
