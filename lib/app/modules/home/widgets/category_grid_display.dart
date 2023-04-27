import 'package:akash/app/data/models/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryGridDisplay extends StatefulWidget {
  const CategoryGridDisplay({
    Key? key,
    this.title = '',
    this.categories = const [],
    this.crossAxisCount = 3,
    this.shape = BoxShape.rectangle,
  }) : super(key: key);
  final String title;
  final int crossAxisCount;
  final List<Category> categories;
  final BoxShape shape;

  @override
  CategoryGridDisplayState createState() => CategoryGridDisplayState();
}

class CategoryGridDisplayState extends State<CategoryGridDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          if (widget.title.isEmpty)
            Container(
              height: 20,
            ),
          if (widget.title.isNotEmpty)
            Container(
              height: 50,
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.only(left: 20),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: Text(
                  widget.title,
                  overflow: TextOverflow.ellipsis,
                  style: Get.textTheme.titleMedium,
                ),
              ),
            ),
          if (widget.categories.isNotEmpty)
            GridView.count(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: widget.crossAxisCount,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 3 / 4,
              children: [
                for (var category in widget.categories)
                  Column(
                    children: [
                      if (category.photoUrl != null)
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              color: context.theme.colorScheme.onInverseSurface,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            child: Image.network(
                              category.photoUrl!,
                            ),
                          ),
                        ),
                      if (category.name != null)
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              category.name!,
                              style: Get.textTheme.bodyMedium,
                            ),
                          ),
                        ),
                    ],
                  )
              ],
            )
        ],
      ),
    );
  }
}
