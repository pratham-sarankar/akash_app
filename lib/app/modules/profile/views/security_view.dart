import 'package:akash/app/modules/profile/views/change_password_view.dart';
import 'package:akash/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../controllers/security_controller.dart';

class SecurityView extends GetView<SecurityController> {
  const SecurityView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Security"),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () {
              Get.toNamed(Routes.CHANGEPASSWORD);
            },
            title: const Text("Change Password"),
            leading: const Icon(IconlyLight.lock),
          )
        ],
      ),
    );
  }
}
