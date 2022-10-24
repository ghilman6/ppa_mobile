import 'package:get/get.dart';
import '../controllers/splash_controller.dart';
import '../data/services/dio_service.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DioService().instance);
    Get.lazyPut<SplashController>(() => SplashController());
    // Get.put<SplashController>(SplashController());
  }
}
