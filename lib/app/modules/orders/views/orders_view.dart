import 'package:akash/app/data/repositories/order_repository.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/orders_controller.dart';

class OrdersView extends GetView<OrdersController> {
  const OrdersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OrdersView'),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(onPressed: (){
          var orderRepository =OrderRepository().getOrders();
          print(orderRepository);
        }, child: const Text('OrdersView')),
      ),
    );
  }
}
