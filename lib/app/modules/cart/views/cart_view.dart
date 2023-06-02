import 'package:akash/app/modules/cart/widgets/cart_tile.dart';
import 'package:akash/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.state?.isEmpty ?? true) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Lottie.asset(
                    "assets/lotties/empty_illustration_lottie.json",
                    height: Get.height * 0.25,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    "Empty Bag",
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 15),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text:
                          "Your bag is empty. Add your \nfavourite products to the bag",
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
        );
      }
      return Scaffold(
        bottomNavigationBar: BottomAppBar(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              const SizedBox(height: 15),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${controller.summary.value.totalProducts} Item(s)",
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: context.theme.colorScheme.onBackground
                          .withOpacity(0.6),
                    ),
                  ),
                  Text(
                    "₹ ${controller.summary.value.orderTotal}",
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  controller.checkout();
                },
                child: Obx(() {
                  if (controller.isCheckingOut.value) {
                    return const CupertinoActivityIndicator(
                        color: Colors.white);
                  }
                  return const Text("Checkout");
                }),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 15),
              Container(
                height: 55,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      "Your Bag",
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Get.theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 3,
                      ),
                      child: Text(
                        "${controller.summary.value.totalProducts} Item(s)",
                        style: Get.textTheme.titleSmall?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      controller.obx((state) {
                        return Column(
                          children: [
                            ...[
                              for (final cartProduct in state!)
                                CartTile(cartProduct: cartProduct)
                            ],
                          ],
                        );
                      }),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          Text(
                            "Sub Total",
                            style: context.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              if (controller.summary.value.discountedTotal <
                                  controller.summary.value.subTotal)
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text(
                                    "₹${controller.summary.value.orderTotal}",
                                    style:
                                        context.textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: context
                                          .theme.colorScheme.onBackground
                                          .withOpacity(0.6),
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ),
                              Text(
                                "₹${controller.summary.value.discountedTotal}",
                                style: context.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 20),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          Text(
                            "Delivery Charges",
                            style: context.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "₹${controller.summary.value.deliveryCharge}",
                            style: context.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 20),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          Text(
                            "Order Total",
                            style: context.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: context.theme.colorScheme.primary,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "₹ ${controller.summary.value.orderTotal}",
                            style: context.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: context.theme.colorScheme.primary,
                            ),
                          ),
                          const SizedBox(width: 20),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );
    });
  }
}
