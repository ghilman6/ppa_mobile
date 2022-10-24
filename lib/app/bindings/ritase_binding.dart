
import 'package:get/get.dart';
import '../controllers/ritase_controller.dart';
import '../data/services/dio_service.dart';


class RitaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RitaseController>(() => RitaseController());
    Get.put(DioService().instance);
        // Get.put<RitaseController>(RitaseController());
  }
}