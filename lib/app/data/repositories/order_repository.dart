


import 'package:akash/app/interfaces/repository.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import '../models/orders/order.dart';
import '../services/auth_service.dart';

class OrderRepository extends Repository<Order> {
  OrderRepository() : super(path: "/users/orders");

  @override
  Order converter(Map<String, dynamic> map) {
    return Order.fromMap(map);
  }

  Future<List<Order>> getOrders() async {
    Response response = await get("/all");
    var orders = response.body["data"]["orders"];
    return orders.map<Order>((order) => converter(order)).toList();
  }

  Future<Order> addOrder(Order order) async {
    Response response = await post("/add", order.toMap());
    var orderData = response.body["data"]["order"];
    return converter(orderData);
  }

  Future<Order> updateOrder(Order order) async {
    Response response = await put("/${order.id}", order.toMap());
    var orderData = response.body["data"]["order"];
    return converter(orderData);
  }

  @override
  Future<Request> authenticator(Request request) async {
    String? accessToken = Get.find<AuthService>().getAccessToken();
    request.headers.addAll({
      'Authorization': 'Bearer $accessToken',
    });
    return request;
  }
}