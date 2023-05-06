import 'package:akash/app/data/models/address.dart';
import 'package:akash/app/data/services/auth_service.dart';
import 'package:akash/app/interfaces/repository.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class AddressRepository extends Repository<Address> {
  AddressRepository() : super(path: "/users/address");

  @override
  Future<Request> authenticator(Request request) async {
    String? accessToken = Get.find<AuthService>().getAccessToken();
    request.headers.addAll({
      'Authorization': 'Bearer $accessToken',
    });
    return request;
  }

  @override
  Address converter(Map<String, dynamic> map) {
    return Address.fromMap(map);
  }

  Future<List<Address>> getAddresses() async {
    Response response = await get("/all");
    var addresses = response.body["data"]["addresses"];
    return addresses.map<Address>((address) => converter(address)).toList();
  }

  Future<Address> addAddress(Address address) async {
    Response response = await post("/add", address.toMap());
    var addressData = response.body["data"]["address"];
    return converter(addressData);
  }

  Future<Address> updateAddress(Address address) async {
    Response response = await put("/${address.id}", address.toMap());
    var addressData = response.body["data"]["address"];
    return converter(addressData);
  }

  Future<bool> removeAddress(int id) async {
    Response response = await delete("/$id");
    return true;
  }
}
