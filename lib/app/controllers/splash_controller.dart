import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ppa_mobile/app/routes/app_routes.dart';

import '../data/provider/repositories/auth_repository.dart';
import '../data/services/cache_manager.dart';

class SplashController extends GetxController with CacheManager {
  final AuthRepository _authRepository = Get.put(AuthRepository(Get.find()));

  Future initializeSettings() async {
    await GetStorage.init();
    final token = getToken();
    if (token != null) {
      _authRepository.checkLogin().then(
            (response) => {
              if (response['status'])
                {
                  Get.offNamed(AppRoutes.HOME),
                }
              else
                {
                  Get.offNamed(AppRoutes.LOGIN, arguments: response['message']),
                }
            },
          );
    } else {
      Future.delayed(const Duration(seconds: 3)).then((_) => Get.offNamed(
          AppRoutes.LOGIN,
          arguments: 'Silahkan login terlebih dahulu.'));
    }
  }
}
