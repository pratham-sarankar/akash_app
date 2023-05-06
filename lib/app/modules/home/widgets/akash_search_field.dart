import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class AkashSearchField extends StatelessWidget {
  const AkashSearchField({Key? key,this.controller,this.autofocus=false, this.onTap}) : super(key: key);
  final VoidCallback? onTap;
  final bool autofocus;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      placeholder: 'Search for product',
      controller: controller,
      backgroundColor: context.theme.colorScheme.onInverseSurface,
      placeholderStyle: context.textTheme.titleMedium?.copyWith(
        color: context.theme.colorScheme.onBackground.withOpacity(0.7),
      ),
      autofocus: autofocus,
      style: context.textTheme.titleMedium,
      onTap: onTap,
      prefixIcon: Container(),
      suffixIcon: Icon(
        IconlyLight.search,
        color: context.theme.colorScheme.onBackground.withOpacity(0.7),
      ),
      suffixInsets: const EdgeInsets.only(right: 15),
      suffixMode: OverlayVisibilityMode.always,
    );
  }
}
