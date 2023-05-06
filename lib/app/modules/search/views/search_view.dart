import 'package:akash/app/modules/home/widgets/akash_search_field.dart';
import 'package:akash/app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: Hero(
          tag: "back_button",
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(IconlyLight.arrow_left),
          ),
        ),
        title: Hero(
          tag: "search_field",
          child: AkashSearchField(
            autofocus: true,
            controller: controller.controller,
          ),
        ),
      ),
      body: controller.obx(
        (state) {
          return GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            childAspectRatio: 0.75,
            mainAxisSpacing: 12,
            padding: const EdgeInsets.all(10),
            children: [
              for (var product in state ?? []) ProductCard(product: product),
            ],
          );
        },
      ),
    );
  }
}
