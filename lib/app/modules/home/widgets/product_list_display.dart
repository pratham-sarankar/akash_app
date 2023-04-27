import 'package:akash/app/data/models/product.dart';
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
                    color: Colors.black.withOpacity(0.70),
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
                      margin: const EdgeInsets.only(right: 20),
                      width: 150,
                      height: 260,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 150,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: context.theme.dividerColor,
                                width: 1,
                                style: BorderStyle.solid,
                                strokeAlign: BorderSide.strokeAlignCenter,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.network(
                              product.photoList![0],
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            product.name ?? "Product Name",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.black.withOpacity(0.70),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "₹${product.discountPrice ?? product.salePrice}",
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: context
                                          .theme.colorScheme.onBackground
                                          .withOpacity(0.70),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  if (product.discountPrice != null)
                                    Text(
                                      "₹${product.salePrice.toString()}",
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        color: context
                                            .theme.colorScheme.onBackground
                                            .withOpacity(0.50),
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                ],
                              ),
                              const Spacer(),
                              TextButton(
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(0),
                                  ),
                                  fixedSize: MaterialStateProperty.all(
                                    const Size(60, 35),
                                  ),
                                  minimumSize: MaterialStateProperty.all(
                                    const Size(10, 10),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                    context.theme.colorScheme.primary
                                        .withOpacity(0.1),
                                  ),
                                  side: MaterialStateProperty.all(
                                    BorderSide(
                                      color: context.theme.colorScheme.primary,
                                      width: 1,
                                      style: BorderStyle.solid,
                                      strokeAlign: BorderSide.strokeAlignCenter,
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Add",
                                  style: context.textTheme.bodyMedium?.copyWith(
                                    color: context.theme.colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
