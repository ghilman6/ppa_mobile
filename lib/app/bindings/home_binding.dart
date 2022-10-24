import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../controllers/lmb_controller.dart';
import '../data/services/dio_service.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.put(DioService().instance);
    Get.put(LmbController());
    // Get.put<HomeController>(HomeController());
  }
}
