import 'package:akash/app/data/models/user.dart';
import 'package:akash/app/data/repositories/profile_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthService extends GetxService {
  late final GetStorage _box;
  late final Rx<User?> currentUser;

  Future<AuthService> init() async {
    await GetStorage.init();
    _box = GetStorage();
    currentUser = Rx<User?>(null);
    await reloadUser();
    return this;
  }

  Future reloadUser() async {
    //If not logged in, set currentUser to null
    if (!isLoggedIn) {
      return;
    }

    var user = await Get.find<ProfileRepository>().getProfile();
    currentUser.value = user;
  }


  String? get accessToken => _box.read('accessToken');

  String? get refreshToken => _box.read('refreshToken');

  bool get isLoggedIn => accessToken != null;

  Future<void> saveAccessToken(String accessToken) async {
    return await _box.write('accessToken', accessToken);
  }

  Future<void> saveRefreshToken(String refreshToken) async {
    return await _box.write('refreshToken', refreshToken);
  }

  Future<bool> logout() async {
    try {
      currentUser.value = null;
      await _box.remove("accessToken");
      await _box.remove("refreshToken");
      return true;
    } catch (e) {
      return false;
    }
  }

  String? getAccessToken() {
    return _box.read('accessToken');
  }

  String? getRefreshToken() {
    return _box.read('refreshToken');
  }
}
