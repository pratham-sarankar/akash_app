import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(IconlyLight.arrow_left),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView(
          children: [
            ListTile(
              leading: const SizedBox(
                  height: double.infinity, child: Icon(CupertinoIcons.sun_max)),
              title: const Text("Dark Mode"),
              subtitle: const Text("Toggle dark mode"),
              trailing: Switch(
                value: controller.isDarkMode.value,
                onChanged: (value) {
                  controller.toggleTheme();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
