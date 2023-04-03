import 'package:akash/app/modules/profile/views/addresses_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../controllers/profile_controller.dart';
import 'account_view.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(IconlyLight.search)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.clear_circled))
        ],
      ),
      body: Column(
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(
                      "https://cdn-icons-png.flaticon.com/512/3135/3135715.png"),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Welcome',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                    Text(
                      'Yash Sarankar',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  style: ButtonStyle(alignment: Alignment.bottomCenter),
                  onPressed: () {},
                  icon: const Icon(IconlyLight.logout),
                ),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(IconlyLight.profile),
            title: const Text("Account"),
            trailing: const Icon(IconlyLight.arrow_right_2),
            onTap: () {
              Get.to(const AccountView());
            },
          ),
          ListTile(
            leading: Icon(IconlyLight.location),
            title: Text("My Addresses"),
            trailing: Icon(IconlyLight.arrow_right_2),
            onTap: () {
              Get.to(const AddressesView());
            },
          ),
          ListTile(
            leading: Icon(IconlyLight.lock),
            title: Text("Security"),
            trailing: Icon(IconlyLight.arrow_right_2),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(IconlyLight.setting),
            title: Text("Settings"),
            trailing: Icon(IconlyLight.arrow_right_2),
            onTap: () {},
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  radius: 100,
                  onTap: () {},
                  child: Text("Privacy Policy", style: TextStyle(fontSize: 12)),
                ),
                const Icon(
                  IconlyLight.arrow_right_2,
                  size: 12,
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  child:
                      const Text("Help Center", style: TextStyle(fontSize: 12)),
                  onTap: () {},
                ),
                const Icon(
                  IconlyLight.arrow_right_2,
                  size: 12,
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  child: const Text("Term & Conditions",
                      style: TextStyle(fontSize: 12)),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const Divider(height: 35,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.copyright,size: 16,),
              SizedBox(
                width: 4,
              ),
              Text(
                "Akash Megamart",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
