import 'package:akash/app/data/models/category.dart';
import 'package:akash/app/data/models/product.dart';
import 'package:akash/app/modules/home/controllers/home_tab_controller.dart';
import 'package:akash/app/modules/home/widgets/akash_search_field.dart';
import 'package:akash/app/modules/home/widgets/category_grid_display.dart';
import 'package:akash/app/modules/home/widgets/product_list_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTabView extends GetView<HomeTabController> {
  const HomeTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AkashSearchField(),
      ),
      // appBar: AppBar(
      //   title: const AkashSearchField(),
      //   bottom: PreferredSize(
      //     preferredSize: const Size.fromHeight(70),
      //     child: SizedBox(
      //       height: 70,
      //       width: Get.width,
      //       child: ListView(
      //         padding: const EdgeInsets.only(right: 18, left: 18),
      //         shrinkWrap: true,
      //         scrollDirection: Axis.horizontal,
      //         children: [
      //           Chip(
      //             backgroundColor: Colors.white,
      //             avatar: const Icon(IconlyLight.filter, size: 25),
      //             side: const BorderSide(
      //               color: Color(0xfff6f6f6),
      //             ),
      //             labelPadding:
      //                 const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      //             padding:
      //                 const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(10),
      //             ),
      //             label: Text(
      //               '',
      //               style: GoogleFonts.poppins(
      //                 color: const Color(0xff202930),
      //                 fontWeight: FontWeight.w600,
      //               ),
      //             ),
      //           ),
      //           ...[
      //             {
      //               "name": "Dairy",
      //               "photo":
      //                   "https://cdn-icons-png.flaticon.com/128/9954/9954768.png",
      //             },
      //             {
      //               "name": "Cosmetics",
      //               "photo":
      //                   "https://cdn-icons-png.flaticon.com/512/3163/3163203.png",
      //             },
      //             {
      //               "name": "Fruits",
      //               "photo":
      //                   "https://cdn-icons-png.flaticon.com/512/1625/1625048.png",
      //             },
      //             {
      //               "name": "Vegetables",
      //               "photo":
      //                   "https://cdn-icons-png.flaticon.com/512/2153/2153786.png",
      //             },
      //             {
      //               "name": "Beverages",
      //               "photo":
      //                   "https://cdn-icons-png.flaticon.com/512/2722/2722527.png",
      //             },
      //             {
      //               "name": "Bakery",
      //               "photo":
      //                   "https://cdn-icons-png.flaticon.com/512/3081/3081967.png",
      //             },
      //             {
      //               "name": "Meat",
      //               "photo":
      //                   "https://cdn-icons-png.flaticon.com/512/3143/3143643.png",
      //             },
      //             {
      //               "name": "Fish",
      //               "photo":
      //                   "https://cdn-icons-png.flaticon.com/512/783/783043.png",
      //             },
      //             {
      //               "name": "Grocery",
      //               "photo":
      //                   "https://cdn-icons-png.flaticon.com/512/1261/1261163.png",
      //             },
      //             {
      //               "name": "Household",
      //               "photo":
      //                   "https://cdn-icons-png.flaticon.com/512/2271/2271046.png",
      //             },
      //             {
      //               "name": "Baby Care",
      //               "photo":
      //                   "https://cdn-icons-png.flaticon.com/512/2827/2827770.png",
      //             },
      //             {
      //               "name": "Personal Care",
      //               "photo":
      //                   "https://cdn-icons-png.flaticon.com/512/3901/3901586.png",
      //             },
      //             {
      //               "name": "Snacks",
      //               "photo":
      //                   "https://cdn-icons-png.flaticon.com/512/2553/2553691.png",
      //             },
      //             {
      //               "name": "Biscuits",
      //               "photo":
      //                   "https://cdn-icons-png.flaticon.com/512/2447/2447689.png",
      //             },
      //             {
      //               "name": "Chocolates",
      //               "photo":
      //                   "https://cdn-icons-png.flaticon.com/512/2136/2136997.png",
      //             },
      //             {
      //               "name": "Ice Cream",
      //               "photo":
      //                   "https://cdn-icons-png.flaticon.com/512/938/938063.png",
      //             },
      //           ].map(
      //             (e) {
      //               return Padding(
      //                 padding: const EdgeInsets.only(left: 10),
      //                 child: Chip(
      //                   backgroundColor: Colors.white,
      //                   avatar: Container(
      //                     height: 50,
      //                     width: 50,
      //                     padding: const EdgeInsets.all(8),
      //                     decoration: BoxDecoration(
      //                       color: const Color(0xfff6f6f6),
      //                       borderRadius: BorderRadius.circular(8),
      //                     ),
      //                     child: Image.network(e['photo']!),
      //                   ),
      //                   side: const BorderSide(
      //                     color: Color(0xfff6f6f6),
      //                   ),
      //                   labelPadding: const EdgeInsets.symmetric(
      //                       vertical: 8, horizontal: 10),
      //                   padding: const EdgeInsets.symmetric(
      //                       horizontal: 8, vertical: 4),
      //                   shape: RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.circular(10),
      //                   ),
      //                   label: Text(
      //                     e['name']!,
      //                     style: GoogleFonts.poppins(
      //                       color: const Color(0xff202930),
      //                       fontWeight: FontWeight.w600,
      //                     ),
      //                   ),
      //                 ),
      //               );
      //             },
      //           ).toList()
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: ListView(
          padding: const EdgeInsets.only(bottom: 20),
          children: [
            CategoryGridDisplay(
              title: "Shop By Category",
              categories: getCategories(),
            ),
            // const OfferWidget(),
            // const DeadLineWidget(capitalizeTitle: true),
            // PageDisplay(
            //   height: 250,
            //   title: "Page Display",
            //   photoList: List.generate(
            //       10,
            //       (index) =>
            //           'https://cdn.dribbble.com/users/110792/screenshots/17024372/placeholder-listings.png?compress=1&resize=400x300'),
            //   animate: false,
            //   duration: const Duration(seconds: 2),
            // ),
            ProductListDisplay(
              title: 'Order Again',
              products: [
                Product(
                  name: "Kurkure Namkeen Masala Munch",
                  photoList: [
                    "https://www.bigbasket.com/media/uploads/p/l/102761_17-kurkure-namkeen-masala-munch.jpg"
                  ],
                  salePrice: 30,
                  discountPrice: 28,
                ),
                Product(
                  name: "Maggi 2-Minute Instant Noodles",
                  photoList: [
                    "https://m.media-amazon.com/images/I/71jfrTizZTL._SX679_.jpg"
                  ],
                  salePrice: 20,
                  discountPrice: 17,
                ),
                Product(
                  name: "Britannia Good Day Butter Biscuit",
                  photoList: [
                    "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=85,metadata=none,w=480,h=480/app/images/products/sliding_image/86864a.jpg?ts=1658907723"
                  ],
                  salePrice: 10,
                ),
              ],
            ),
            // const GridDisplay(
            //   crossAxisCount: 3,
            //   title: 'Grid Display',
            //   shape: BoxShape.rectangle,
            //   urlList: [
            //     'https://www.askgalore.com/wp-content/uploads/2020/06/placeholder.png',
            //     'https://www.askgalore.com/wp-content/uploads/2020/06/placeholder.png',
            //     'https://www.askgalore.com/wp-content/uploads/2020/06/placeholder.png',
            //     'https://www.askgalore.com/wp-content/uploads/2020/06/placeholder.png',
            //     'https://www.askgalore.com/wp-content/uploads/2020/06/placeholder.png',
            //     'https://www.askgalore.com/wp-content/uploads/2020/06/placeholder.png',
            //   ],
            // ),
            // const QuoteDisplay(
            //   quote: 'In difficult time, fashion is always outrageous.',
            //   speaker: 'Elsa Schiaparelli',
            // ),
          ],
        ),
      ),
    );
  }

  List<Category> getCategories() {
    return [
      Category(
        name: 'Dairy',
        photoUrl: 'https://cdn-icons-png.flaticon.com/128/9954/9954768.png',
      ),
      Category(
        name: 'Cosmetics',
        photoUrl: 'https://cdn-icons-png.flaticon.com/512/3163/3163203.png',
      ),
      Category(
        name: 'Fruits',
        photoUrl: 'https://cdn-icons-png.flaticon.com/512/1625/1625048.png',
      ),
      Category(
        name: 'Vegetables',
        photoUrl: 'https://cdn-icons-png.flaticon.com/512/2153/2153786.png',
      ),
      Category(
        name: 'Beverages',
        photoUrl: 'https://cdn-icons-png.flaticon.com/512/2722/2722527.png',
      ),
      Category(
        name: 'Bakery',
        photoUrl: 'https://cdn-icons-png.flaticon.com/512/3081/3081967.png',
      ),
      Category(
        name: 'Meat',
        photoUrl: 'https://cdn-icons-png.flaticon.com/512/3143/3143643.png',
      ),
      Category(
        name: 'Fish',
        photoUrl: 'https://cdn-icons-png.flaticon.com/512/783/783043.png',
      ),
      Category(
        name: 'Grocery',
        photoUrl: 'https://cdn-icons-png.flaticon.com/512/1261/1261163.png',
      ),
      Category(
        name: 'Household',
        photoUrl: 'https://cdn-icons-png.flaticon.com/512/2271/2271046.png',
      ),
      Category(
        name: 'Baby Care',
        photoUrl: 'https://cdn-icons-png.flaticon.com/512/2827/2827770.png',
      ),
      Category(
        name: 'Personal Care',
        photoUrl: 'https://cdn-icons-png.flaticon.com/512/3901/3901586.png',
      ),
      Category(
        name: 'Snacks',
        photoUrl: 'https://cdn-icons-png.flaticon.com/512/2553/2553691.png',
      ),
      Category(
        name: 'Biscuits',
        photoUrl: 'https://cdn-icons-png.flaticon.com/512/2447/2447689.png',
      ),
      Category(
        name: 'Chocolates',
        photoUrl: 'https://cdn-icons-png.flaticon.com/512/2136/2136997.png',
      ),
      Category(
        name: 'Ice Cream',
        photoUrl: 'https://cdn-icons-png.flaticon.com/512/938/938063.png',
      ),
    ];
  }
}
