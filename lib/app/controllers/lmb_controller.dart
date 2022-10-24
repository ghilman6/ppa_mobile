import 'package:ppa_mobile/app/data/models/point_ppa.dart';

import '../data/models/lmb.dart';
import '../data/provider/repositories/lmb_repository.dart';
import '../data/services/cache_manager.dart';
import 'package:get/get.dart';

import '../ui/global_widgets/openrespon_dialog.dart';

class LmbController extends GetxController with CacheManager {
  final LmbRepository lmbRepository = Get.put(LmbRepository(Get.find()));
  final isLoading = false.obs;
  final listLmb = <Lmb>[].obs;
  final listPointPPA = <PointPpa>[].obs;
  final selectedPointPPA = PointPpa().obs;
  final pointIsSelected = false.obs;

  @override
  void onInit() {
    getPoint();
    super.onInit();
  }

  Future getPoint() async {
    isLoading.value = true;
    lmbRepository.getPointPPA().then((response) => {
          isLoading.value = false,
          if (response['status'])
            {
              listPointPPA.value = PointPpa().jsonToList(response['data']),
            }
          else
            {openDialogResponse(response['message'])},
        });
  }

  Future getLmb() async {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
    isLoading.value = true;
    lmbRepository.getLMB(selectedPointPPA.value.idPoint).then((response) => {
          isLoading.value = false,
          if (response['status'])
            {
              listLmb.value = Lmb().jsonToList(response['data']),
            }
          else
            {
              openDialogResponse(response['message']),
            }
        });
  }

  void onChangedDropdown(newValue) {
    selectedPointPPA(newValue as PointPpa);
    pointIsSelected.value = true;
    if (isLoading.value == false) {
      getLmb();
    }
  }

  void openDialogResponse(String message) {
    Get.dialog(
      OpenDialogResponse(message: message),
      barrierDismissible: false,
    );
  }
}
