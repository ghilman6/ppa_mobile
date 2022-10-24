import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../controllers/ritase_controller.dart';

class PunumpangDialog extends GetView<RitaseController> {
  final int index;
  const PunumpangDialog(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: context.theme.dialogBackgroundColor,
        insetPadding: const EdgeInsets.all(16),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        title: Stack(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24.0),
              decoration: const BoxDecoration(
                color: Color(0xFF02499B),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Center(
                child: Text(
                  "Ritase ke - ${controller.listRitase[index].ritase ?? 0}",
                  style: context.theme.textTheme.subtitle2!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Get.isDarkMode ? null : const Color(0xFFF1F4F8),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                color: Colors.white,
                icon: const Icon(Icons.close),
                onPressed: () => Get.back(),
              ),
            ),
          ],
        ),
        titlePadding: const EdgeInsets.all(0),
        contentPadding: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 16.0, bottom: 0),
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Jumlah PNP',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              const SizedBox(height: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Get.isDarkMode ? Colors.grey[900] : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 5,
                      color: Color(0x33000000),
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                    Flexible(
                      child: TextFormField(
                        controller: controller.controllerPenumpang.value,
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(2),
                        ],
                        // validator: controller.keteranganAllowed()
                        //     ? (value) =>
                        //     controller.validator(value!)
                        //     : null,
                        style: context.theme.textTheme.subtitle2!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Masukan Jumlah Penumpang',
                          hintStyle:
                              context.theme.textTheme.subtitle2!.copyWith(
                            color:
                                Get.isDarkMode ? null : const Color(0x6602499B),
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: ElevatedButton(onPressed: ()=>Get.back(result: true), child: const Text('Simpan', style: TextStyle(fontWeight: FontWeight.w700),)),
        )
      ],
    );
  }
}
