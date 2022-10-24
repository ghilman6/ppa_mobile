import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ppa_mobile/app/data/models/ritase.dart';

import '../data/models/lmb.dart';
import '../data/models/ritase_lmb.dart';
import '../data/provider/repositories/ritase_repository.dart';
import '../ui/global_widgets/dialog_alert.dart';
import '../ui/global_widgets/dialog_custom.dart';
import '../ui/global_widgets/onloading_dialog.dart';
import '../ui/global_widgets/openrespon_dialog.dart';
import '../ui/pages/ritase_page/penumpang_dialog.dart';

class RitaseController extends GetxController {
  final RitaseRepository ritaseRepository =
      Get.put(RitaseRepository(Get.find()));
  final lmb = Lmb().obs;
  final isLoading = false.obs;
  final listRitase = <Ritase>[].obs;
  final ritaseLmb = RitaseLmb().obs;
  final controllerPenumpang = TextEditingController().obs;

  @override
  void onInit() {
    lmb.value = Get.arguments;
    getRitase();
    super.onInit();
  }

  Future getRitase() async {
    isLoading.value = true;
    ritaseRepository.getRitase(idLmb: lmb.value.idLmb).then((response) => {
          isLoading.value = false,
          if (response['status'])
            {
              listRitase.value = Ritase().jsonToList(response['data_ritase']),
              ritaseLmb.value = RitaseLmb.fromJson(response['data_lmb'])
            }
          else
            {openDialogResponse(response['message'])},
        });
  }

  Future addRitase() async {
    late String nextArah;
    if (ritaseLmb.value.currentRitase == '0') {
      bool? arah = await Get.dialog(
        const DialogAlert(
          title: 'Silahkan pilih Arah!',
          subtitle: 'Pilih Arah Ritase Pertama!',
          textButtonNo: 'Pulang',
          textButtonYes: 'Berangkat',
        ),
      );
      if (arah == null) {
        return;
      }
      nextArah = arah == true ? '1' : '2';
    } else {
      nextArah = ritaseLmb.value.nextArah.toString();
    }
    isLoading.value = true;
    onLoading();
    ritaseRepository
        .addRitase(
            idLmb: ritaseLmb.value.idLmb,
            ritase: ritaseLmb.value.nextRitase.toString(),
            arah: nextArah)
        .then((response) => {
              isLoading.value = false,
              if (Get.isDialogOpen!) {Get.back()},
              if (response['status'])
                {
                  getRitase(),
                  Get.dialog(
                    DialogCustom(
                      title: 'Berhasil!',
                      subtitle: response['message'],
                      pagetitle: 'Tutup',
                    ),
                    barrierDismissible: false,
                  ),
                }
              else
                {
                  Get.dialog(
                    DialogCustom(
                      title: 'GAGAL!',
                      subtitle: response['message'],
                      pagetitle: 'Tutup',
                      img: 'assets/image/dialog-failed.png',
                    ),
                    barrierDismissible: false,
                  )
                },
            });
  }

  Future updatePenumpang(index) async {
    if (listRitase[index].jmlPenumpang != '0') {
      controllerPenumpang.value.text =
          listRitase[index].jmlPenumpang.toString();
    }
    bool? isUpdate =
        await Get.dialog(PunumpangDialog(index), barrierDismissible: false);

    if (controllerPenumpang.value.text ==
        listRitase[index].jmlPenumpang.toString()) {
      isUpdate = false;
    }
    if (isUpdate == true && controllerPenumpang.value.text.isNotEmpty) {
      isLoading.value = true;
      onLoading();
      ritaseRepository
          .updatePenumpang(
              idLmbPpa: listRitase[index].idLmbPpa,
              jmlPenumpang: controllerPenumpang.value.text)
          .then((response) => {
                isLoading.value = false,
                if (Get.isDialogOpen!) {Get.back()},
                if (response['status'])
                  {
                    getRitase(),
                    Get.dialog(
                      DialogCustom(
                        title: 'Berhasil!',
                        subtitle: response['message'],
                        pagetitle: 'Tutup',
                      ),
                      barrierDismissible: false,
                    ),
                  }
                else
                  {
                    Get.dialog(
                      DialogCustom(
                        title: 'GAGAL!',
                        subtitle: response['message'],
                        pagetitle: 'Tutup',
                        img: 'assets/image/dialog-failed.png',
                      ),
                      barrierDismissible: false,
                    )
                  },
              });
    }
    controllerPenumpang.value.clear();
  }

  Future deleteRitase() async {
    bool? isDelete = await Get.dialog(
      const DialogAlert(
        subtitle: "Apakah Anda yakin ingin menghapus Ritase terakhir ?",
      ),
    );
    if (isDelete == true) {
      isLoading.value = true;
      onLoading();
      ritaseRepository
          .deleteRitase(
              idLmbPpa: listRitase[0].idLmbPpa, ritase: listRitase[0].ritase)
          .then((response) => {
                isLoading.value = false,
                if (Get.isDialogOpen!) {Get.back()},
                if (response['status'])
                  {
                    getRitase(),
                    Get.dialog(
                      DialogCustom(
                        title: 'Berhasil!',
                        subtitle: response['message'],
                        pagetitle: 'Tutup',
                      ),
                      barrierDismissible: false,
                    ),
                  }
                else
                  {
                    Get.dialog(
                      DialogCustom(
                        title: 'GAGAL!',
                        subtitle: response['message'],
                        pagetitle: 'Tutup',
                        img: 'assets/image/dialog-failed.png',
                      ),
                      barrierDismissible: false,
                    )
                  },
              });
    }
  }

  void openDialogResponse(String message) {
    Get.dialog(
      OpenDialogResponse(message: message),
      barrierDismissible: false,
    );
  }

  void onLoading() {
    Get.dialog(
      const OnLoading(),
      barrierDismissible: false,
    );
  }
}
