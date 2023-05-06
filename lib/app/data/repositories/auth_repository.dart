import 'package:akash/app/data/models/user.dart';
import 'package:akash/app/data/repositories/cart_repository.dart';
import 'package:akash/app/data/repositories/wishlist_repository.dart';
import 'package:akash/app/data/services/auth_service.dart';
import 'package:akash/app/interfaces/repository.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class AuthRepository extends Repository<User> {
  AuthRepository() : super(path: "/users/auth");

  //Signin Methods
  Future<String> signInWithContactNumber(String contactNumber) async {
    Response response = await post("/signin/contact-number", {
      "contactNumber": contactNumber,
    });
    var token = response.body["data"]["verificationCode"];
    return token;
  }

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    Response response = await post("/signin/email", {
      "email": email,
      "password": password,
    });
    var data = response.body["data"];
    var accessToken = data["accessToken"];
    var refreshToken = data["refreshToken"];

    final authService = Get.find<AuthService>();
    await authService.saveAccessToken(accessToken);
    await authService.saveRefreshToken(refreshToken);
    await authService.reloadUser();

    //After login, initialize the repositories
    Get.find<WishlistRepository>().onInit();
    Get.find<CartRepository>().onInit();

    return true;
  }

  Future<String> verifyOtp(String otp, String verificationCode) async {
    Response response = await post("/verify-otp", {
      "otp": otp,
      "verificationCode": verificationCode,
    });
    var accessToken = response.body["data"]["accessToken"];
    var refreshToken = response.body["data"]["accessToken"];

    await Get.find<AuthService>().saveAccessToken(accessToken);
    await Get.find<AuthService>().saveRefreshToken(refreshToken);
    await Get.find<AuthService>().reloadUser();
    return accessToken;
  }

  //Signup Methods
  Future<String> signUpWithContactNumber(String contactNumber) async {
    Response response = await post("/signup/contact-number", {
      "contactNumber": contactNumber,
    });
    var token = response.body["data"]["verificationCode"];
    return token;
  }

  Future<String> signUpWithEmailAndPassword(
      String email, String password) async {
    Response response = await post("/signup/email", {
      "email": email,
      "password": password,
    });
    var token = response.body["data"]["verificationCode"];
    return token;
  }

  //Reset Password Methods
  Future<String> resetPassword(String contactNumber) async {
    Response response = await post("/recover/password", {
      "identity": contactNumber,
    });
    var token = response.body["data"]["verificationCode"];
    return token;
  }

  Future<bool> updatePassword(String accessToken,
      {required String password, required String newPassword}) async {
    Response response = await post(
      "/me/update-password",
      {
        "password": password,
        "newPassword": password,
      },
      headers: {
        "Authorization": "Bearer $accessToken",
      },
    );
    return true;
  }

  Future<String?> refreshAccessToken() async {
    try {
      var accessToken = Get.find<AuthService>().getAccessToken();
      var refreshToken = Get.find<AuthService>().getRefreshToken();

      Response response = await post("/refresh-token", {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      });

      var newAccessToken = response.body["data"]["accessToken"];
      var newRefreshToken = response.body["data"]["refreshToken"];

      await Get.find<AuthService>().saveAccessToken(newAccessToken);
      await Get.find<AuthService>().saveRefreshToken(newRefreshToken);

      return newAccessToken;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Request> authenticator(Request request) async {
    return request;
  }

  @override
  User converter(Map<String, dynamic> map) => User.fromMap(map);
}
