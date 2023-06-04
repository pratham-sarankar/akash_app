import 'package:akash/app/data/services/auth_service.dart';
import 'package:akash/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Obx(
                () => CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    Get.find<AuthService>().currentUser.value?.photoKey ??
                        "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Obx(
                () => Text(
                  Get.find<AuthService>().currentUser.value?.name ??
                      "Your name",
                  style: context.textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 2),
              Obx(
                () => Text(
                  Get.find<AuthService>().currentUser.value?.contact ?? "-",
                  style: context.textTheme.bodyLarge,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          ListTile(
            leading: const SizedBox(
                height: double.infinity, child: Icon(IconlyLight.profile)),
            title: const Text("Account"),
            subtitle: const Text("Manage your account"),
            trailing: const Icon(IconlyLight.arrow_right_2),
            onTap: () {
              Get.toNamed(Routes.ACCOUNT);
            },
          ),
          ListTile(
            leading: const SizedBox(
                height: double.infinity, child: Icon(IconlyLight.location)),
            title: const Text("My Addresses"),
            subtitle: const Text("Office, home, other"),
            trailing: const Icon(IconlyLight.arrow_right_2),
            onTap: () {
              Get.toNamed(Routes.ADDRESSES);
            },
          ),
          ListTile(
            leading: const SizedBox(
                height: double.infinity, child: Icon(IconlyLight.bag_2)),
            title: const Text("Orders"),
            subtitle: const Text("Check your order status"),
            trailing: const Icon(IconlyLight.arrow_right_2),
            onTap: () {
              Get.toNamed(Routes.ORDERS);
            },
          ),
          ListTile(
            leading: const SizedBox(
                height: double.infinity, child: Icon(IconlyLight.buy)),
            title: const Text("Wishlist"),
            subtitle: const Text("Your favourite products"),
            trailing: const Icon(IconlyLight.arrow_right_2),
            onTap: () {
              Get.toNamed(Routes.WISHLIST);
            },
          ),
          ListTile(
            leading: const SizedBox(
                height: double.infinity, child: Icon(IconlyLight.lock)),
            title: const Text("Security"),
            subtitle: const Text("Change password, PIN"),
            trailing: const Icon(IconlyLight.arrow_right_2),
            onTap: () {
              Get.toNamed(Routes.SECURITY);
            },
          ),
          ListTile(
            leading: const SizedBox(
                height: double.infinity, child: Icon(IconlyLight.setting)),
            title: const Text("Settings"),
            subtitle: const Text("Dark mode, notification etc."),
            trailing: const Icon(IconlyLight.arrow_right_2),
            onTap: () {
              Get.toNamed(Routes.SETTINGS);
            },
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: OutlinedButton(
              onPressed: controller.logout,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "LOG OUT",
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
              top: 30,
              right: 20,
              bottom: 50,
              left: 20,
            ),
            child: Text(
              "APP VERSION 1.0.0",
            ),
          )
        ],
      ),
    );
  }
}
