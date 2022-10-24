import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controllers/ritase_controller.dart';
import '../../utils/constants/colors.dart';

class RitasePage extends GetView<RitaseController> {
  const RitasePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text('Ritase #${controller.lmb.value.kdArmada}')),
        backgroundColor: PRIMARY_COLOR,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => controller.listRitase.isNotEmpty
                  ? controller.deleteRitase()
                  : null,
              icon: const Icon(Icons.delete))
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : controller.listRitase.isEmpty
                ? RefreshIndicator(
                    onRefresh: () => controller.getRitase(),
                    child: SingleChildScrollView(
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
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: () => controller.getRitase(),
                    child: ListView.builder(
                        itemCount: controller.listRitase.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () => controller.updatePenumpang(index),
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
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/ritase.svg'),
                                        Expanded(
                                          child: Table(
                                            // border: TableBorder.all(),
                                            defaultVerticalAlignment:
                                                TableCellVerticalAlignment
                                                    .middle,
                                            defaultColumnWidth:
                                                const IntrinsicColumnWidth(),
                                            children: [
                                              TableRow(
                                                children: [
                                                  Text(
                                                    "Ritase",
                                                    textAlign: TextAlign.center,
                                                    style: context.theme
                                                        .textTheme.subtitle2!
                                                        .copyWith(
                                                            color: Get
                                                                    .isDarkMode
                                                                ? null
                                                                : const Color(
                                                                    0xFF02499B),
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 10),
                                                  ),
                                                  Text(
                                                    "Arah",
                                                    textAlign: TextAlign.center,
                                                    style: context.theme
                                                        .textTheme.subtitle2!
                                                        .copyWith(
                                                            color: Get
                                                                    .isDarkMode
                                                                ? null
                                                                : const Color(
                                                                    0xFF02499B),
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 10),
                                                  ),
                                                  Text(
                                                    "Jumlah PNP",
                                                    textAlign: TextAlign.center,
                                                    style: context.theme
                                                        .textTheme.subtitle2!
                                                        .copyWith(
                                                            color: Get
                                                                    .isDarkMode
                                                                ? null
                                                                : const Color(
                                                                    0xFF02499B),
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 10),
                                                  ),
                                                  Text(
                                                    "Kode Armada",
                                                    textAlign: TextAlign.center,
                                                    style: context.theme
                                                        .textTheme.subtitle2!
                                                        .copyWith(
                                                            color: Get
                                                                    .isDarkMode
                                                                ? null
                                                                : const Color(
                                                                    0xFF02499B),
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 10),
                                                  ),
                                                ],
                                              ),
                                              TableRow(children: [
                                                Text(
                                                  'ke- ${controller.listRitase[index].ritase ?? 0}',
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  controller.listRitase[index]
                                                              .arah ==
                                                          '1'
                                                      ? 'Berangkat'
                                                      : 'Pulang',
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  '${controller.listRitase[index].jmlPenumpang ?? 0} Orang',
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  controller.listRitase[index]
                                                          .kdArmada ??
                                                      'Memuat...',
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ]),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceEvenly,
                                    //   crossAxisAlignment:
                                    //       CrossAxisAlignment.start,
                                    //   children: [
                                    //     SvgPicture.asset(
                                    //         'assets/icons/ritase.svg'),
                                    //
                                    //     Expanded(
                                    //       child: Column(
                                    //         children: [
                                    //           Text(
                                    //             "Ritase",
                                    //             textAlign: TextAlign.center,
                                    //             style: context
                                    //                 .theme.textTheme.subtitle2!
                                    //                 .copyWith(
                                    //                     color: Get.isDarkMode
                                    //                         ? null
                                    //                         : const Color(
                                    //                             0xFF02499B),
                                    //                     fontWeight:
                                    //                         FontWeight.w700,
                                    //                     fontSize: 10),
                                    //           ),
                                    //           const SizedBox(
                                    //             height: 6,
                                    //           ),
                                    //           Text(
                                    //             'Ritase ke- ${controller.listRitase[index].ritase} asdasdasdasdas',
                                    //             style: const TextStyle(
                                    //                 fontSize: 10,
                                    //                 fontWeight:
                                    //                     FontWeight.w400),
                                    //           ),
                                    //         ],
                                    //       ),
                                    //     ),
                                    //     Expanded(
                                    //       child: Column(
                                    //         children: [
                                    //           Text(
                                    //             "Kode Trayek",
                                    //             textAlign: TextAlign.center,
                                    //             style: context
                                    //                 .theme.textTheme.subtitle2!
                                    //                 .copyWith(
                                    //                     color: Get.isDarkMode
                                    //                         ? null
                                    //                         : const Color(
                                    //                             0xFF02499B),
                                    //                     fontWeight:
                                    //                         FontWeight.w700,
                                    //                     fontSize: 10),
                                    //           ),
                                    //           const SizedBox(
                                    //             height: 6,
                                    //           ),
                                    //           Text(
                                    //             '${controller.listRitase[index].kdTrayek}',
                                    //             style: const TextStyle(
                                    //                 fontSize: 10,
                                    //                 fontWeight:
                                    //                     FontWeight.w400),
                                    //           ),
                                    //         ],
                                    //       ),
                                    //     ),
                                    //
                                    //     Expanded(
                                    //       child: Column(
                                    //         children: [
                                    //           Text(
                                    //             "Jumlah Penumpang",
                                    //             textAlign: TextAlign.center,
                                    //             style: context
                                    //                 .theme.textTheme.subtitle2!
                                    //                 .copyWith(
                                    //                     color: Get.isDarkMode
                                    //                         ? null
                                    //                         : const Color(
                                    //                             0xFF02499B),
                                    //                     fontWeight:
                                    //                         FontWeight.w700,
                                    //                     fontSize: 10),
                                    //           ),
                                    //           const SizedBox(
                                    //             height: 6,
                                    //           ),
                                    //           Text(
                                    //             controller.listRitase[index]
                                    //                     .jmlPenumpang ??
                                    //                 'Memuat ...',
                                    //             style: const TextStyle(
                                    //                 fontSize: 10,
                                    //                 fontWeight:
                                    //                     FontWeight.w400),
                                    //           ),
                                    //         ],
                                    //       ),
                                    //     ),
                                    //     Expanded(
                                    //       child: Column(
                                    //         children: [
                                    //           Text(
                                    //             "Jumlah Penumpang",
                                    //             textAlign: TextAlign.center,
                                    //             style: context
                                    //                 .theme.textTheme.subtitle2!
                                    //                 .copyWith(
                                    //                     color: Get.isDarkMode
                                    //                         ? null
                                    //                         : const Color(
                                    //                             0xFF02499B),
                                    //                     fontWeight:
                                    //                         FontWeight.w700,
                                    //                     fontSize: 10),
                                    //           ),
                                    //           const SizedBox(
                                    //             height: 6,
                                    //           ),
                                    //           Text(
                                    //             controller.listRitase[index]
                                    //                     .jmlPenumpang ??
                                    //                 'Memuat ...',
                                    //             style: const TextStyle(
                                    //                 fontSize: 10,
                                    //                 fontWeight:
                                    //                     FontWeight.w400),
                                    //           ),
                                    //         ],
                                    //       ),
                                    //     ),
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
                                    // ],
                                    // ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            controller.isLoading.value ? null : controller.addRitase(),
        backgroundColor: const Color(0xFFF2994A),
        child: const Icon(Icons.add),
      ),
    );
  }
}
