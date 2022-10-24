import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ppa_mobile/app/controllers/lmb_controller.dart';
import 'package:ppa_mobile/app/routes/app_routes.dart';

import '../../utils/constants/colors.dart';

class ListLmb extends GetView<LmbController> {
  const ListLmb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.pointIsSelected.value
        ? controller.isLoading.value
            ? SizedBox(
                height: MediaQuery.of(context).size.height - 330,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : controller.listLmb.isEmpty
                ? SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height - 330,
                      child: Center(
                        child: Image.asset(
                          'assets/image/nodata.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: controller.listLmb.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(bottom: 16),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () => Get.toNamed(AppRoutes.RITASE, arguments: controller.listLmb[index]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 24.0, right: 24.0),
                          child: Container(
                            decoration: index % 2 == 0
                                ? kGradientBoxDecoration
                                : kGradientBoxDecorationRevese,
                            child: Container(
                              margin: const EdgeInsets.all(1),
                              decoration: Get.isDarkMode
                                  ? kInnerDecorationDark
                                  : kInnerDecoration,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 14.0, horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SvgPicture.asset(
                                        'assets/icons/icon_bus.svg'),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            "Kode Trayek",
                                            style: context
                                                .theme.textTheme.subtitle2!
                                                .copyWith(
                                                    color: Get.isDarkMode
                                                        ? null
                                                        : const Color(
                                                            0xFF02499B),
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 10),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            '${controller.listLmb[index].kdTrayek}',
                                            style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            "Kode Armada",
                                            style: context
                                                .theme.textTheme.subtitle2!
                                                .copyWith(
                                                    color: Get.isDarkMode
                                                        ? null
                                                        : const Color(
                                                            0xFF02499B),
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 10),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            '${controller.listLmb[index].kdArmada}',
                                            style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            "Driver",
                                            style: context
                                                .theme.textTheme.subtitle2!
                                                .copyWith(
                                                    color: Get.isDarkMode
                                                        ? null
                                                        : const Color(
                                                            0xFF02499B),
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 10),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            controller.listLmb[index].driver1 ??
                                                'Memuat ...',
                                            style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Expanded(
                                    //   flex: 2,
                                    //   child: Row(
                                    //     children: [
                                    //       SvgPicture.asset(controller
                                    //           .validationAsset(controller
                                    //               .listAttendance[index]
                                    //               .validasiMasuk!)),
                                    //       const SizedBox(width: 4),
                                    //       Flexible(
                                    //         child: Text(
                                    //             controller
                                    //                 .listAttendance[index]
                                    //                 .validasiMasuk!,
                                    //             style: const TextStyle(
                                    //                 fontSize: 10,
                                    //                 fontWeight:
                                    //                     FontWeight.w400,
                                    //                 fontStyle:
                                    //                     FontStyle.italic)),
                                    //       )
                                    //     ],
                                    //   ),
                                    // )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
        : const SizedBox());
  }
}
