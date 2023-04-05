import 'package:akash/app/modules/profile/views/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
          () {
        return Scaffold(
          body: IndexedStack(
            index: controller.index.value,
            children: const [
              ProfileView(),
              ProfileView(),
              ProfileView(),
            ],
          ),
        );
      },
    );
  }
}
