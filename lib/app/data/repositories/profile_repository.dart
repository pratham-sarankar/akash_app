import 'package:akash/app/data/models/user.dart';
import 'package:akash/app/data/services/auth_service.dart';
import 'package:akash/app/interfaces/repository.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:image_picker/image_picker.dart';

class ProfileRepository extends Repository<User> {
  ProfileRepository() : super(path: "/users/profile/me");

  Future<User?> getProfile() async {
    Response response = await get("/");
    final userData = response.body?['data']?['user'];
    if (userData == null) {
      return null;
    }
    return User.fromMap(userData);
  }

  Future<bool> updatePassword({
    required String accessToken,
    required String password,
    required String newPassword,
  }) async {
    Response response = await put(
      "/password",
      {
        "password": password,
        "newPassword": newPassword,
      },
      headers: {
        "Authorization": "Bearer $accessToken",
      },
    );
    return true;
  }

  Future<bool> resetPassword({
    required String accessToken,
    required String password,
  }) async {
    Response response = await put(
      "/reset/password",
      {
        "password": password,
      },
      headers: {
        "Authorization": "Bearer $accessToken",
      },
    );
    return true;
  }

  Future<bool> updateProfile({
    String? username,
    String? displayName,
    String? contactNumber,
    String? dateOfBirth,
    String? email,
  }) async {
    Response response = await put('/', {
      'username': username,
      'displayName': displayName,
      'contactNumber': contactNumber,
      'dateOfBirth': dateOfBirth,
      'email': email,
    });
    var body = response.body['data']['user'];
    Get.find<AuthService>().currentUser.value = User.fromMap(body);
    await Get.find<AuthService>().reloadUser();
    return true;
  }

  @override
  Future<Request> authenticator(Request request) async {
    String? accessToken = Get.find<AuthService>().getAccessToken();
    request.headers.addAll({
      'Authorization': 'Bearer $accessToken',
    });
    return request;
  }

  @override
  User converter(Map<String, dynamic> map) => User.fromMap(map);

  Future<String?> updateProfilePicture() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return null;

    var data = await image.readAsBytes();
    Response response = await post(
      "/photo",
      FormData(
        {
          'file': MultipartFile(
            data,
            filename: DateTime.now().toIso8601String(),
          ),
        },
      ),
    );

    var message = response.body['message'];
    await Get.find<AuthService>().reloadUser();
    return message;
  }
}
