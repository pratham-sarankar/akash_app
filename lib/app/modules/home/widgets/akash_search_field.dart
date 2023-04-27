import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class AkashSearchField extends StatelessWidget {
  const AkashSearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AkashSearchFieldController(),
      builder: (controller) {
        return CupertinoSearchTextField(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          placeholder: 'Search for product',
          controller: controller.searchController,
          backgroundColor: context.theme.colorScheme.onInverseSurface,
          placeholderStyle: context.textTheme.titleMedium?.copyWith(
            color: context.theme.colorScheme.onBackground.withOpacity(0.7),
          ),
          style: context.textTheme.titleMedium,
          prefixIcon: Container(),
          suffixIcon: Icon(
            IconlyLight.search,
            color: context.theme.colorScheme.onBackground.withOpacity(0.7),
          ),
          suffixInsets: const EdgeInsets.only(right: 15),
          suffixMode: OverlayVisibilityMode.always,
        );
      },
    );
  }
}

class AkashSearchFieldController extends GetxController {
  late TextEditingController searchController;

  @override
  void onInit() {
    searchController = TextEditingController();
    super.onInit();
  }
}
