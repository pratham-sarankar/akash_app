import 'package:akash/app/data/models/product.dart';
import 'package:akash/app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductListDisplay extends StatefulWidget {
  const ProductListDisplay({
    Key? key,
    this.title = '',
    this.products = const [],
  }) : super(key: key);
  final String title;
  final List<Product> products;

  @override
  ProductListDisplayState createState() => ProductListDisplayState();
}

class ProductListDisplayState extends State<ProductListDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(bottom: 20),
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title.isNotEmpty)
            Container(
              height: 50,
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.only(left: 20),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  widget.title,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          if (widget.products.isNotEmpty)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 20),
                  for (final product in widget.products)
                    Container(
                      margin: const EdgeInsets.only(right: 15),
                      height: 250,
                      width: 180,
                      child: ProductCard(product: product),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
