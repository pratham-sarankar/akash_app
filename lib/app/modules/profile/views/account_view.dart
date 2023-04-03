import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class AccountView extends GetView {
  const AccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
            child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            const CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(
                  "https://cdn-icons-png.flaticon.com/512/3135/3135715.png"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Username",hintText: "john"),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Full Name",hintText: "John Doe"),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Contact Number"),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Email",hintText: "example@gmail.com"),
                  ),
                  const SizedBox(height: 40,),
                  SizedBox(
                    height: 60,
                    width: 340,
                    child:  ElevatedButton(onPressed: (){}, child: const Text("SAVE"),
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
