import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AddressesView extends GetView {
  const AddressesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Addresses'),
          centerTitle: true,
        ),
        body: Container(),
    );
  }
}
