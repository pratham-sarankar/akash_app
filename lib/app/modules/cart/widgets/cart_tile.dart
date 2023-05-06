import 'package:akash/app/data/models/cart_product.dart';
import 'package:akash/app/modules/cart/controllers/cart_product_controller.dart';
import 'package:flutter/material.dart';
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
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Image.asset("assets/default_product.png", width: 100),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
              ],
            ),
          ),
          const SizedBox(width: 10),
          Obx(() {
            return Row(
              children: [
                GestureDetector(
                  onTap: () {
                    final newQuantity = controller.cartQuantity.value - 1;
                    controller.onUpdateQuantity(newQuantity);
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
                    (controller.cartQuantity.value).toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    final newQuantity = controller.cartQuantity.value + 1;
                    controller.onUpdateQuantity(newQuantity);
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
                    child: const Text("+"),
                  ),
                )
              ],
            );
          }),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
