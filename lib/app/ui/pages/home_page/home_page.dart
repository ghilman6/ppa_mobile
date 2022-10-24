import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ppa_mobile/app/data/models/point_ppa.dart';
import 'package:ppa_mobile/app/ui/pages/home_page/appbar.dart';

import '../../../controllers/home_controller.dart';
import '../../../controllers/lmb_controller.dart';
import 'lmb.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);
  final LmbController controllerLmb = Get.put(Get.find());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(131.0),
          child: AppBarCustom(),
        ),
        body: SafeArea(
          child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Obx(
                () => RefreshIndicator(
                  onRefresh: controllerLmb.isLoading.value
                      ? () async {}
                      : () async => controllerLmb.getLmb(),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      // mainAxisSize: MainAxisSize.max,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 18, 24, 0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: Get.isDarkMode
                                  ? Colors.grey[900]
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Color(0x33000000),
                                  offset: Offset(0, 2),
                                )
                              ],
                            ),
                            child: DropdownButtonFormField(
                              menuMaxHeight: 300,
                              hint: Text(
                                'Pilih Point PPA',
                                style: context.theme.textTheme.caption!
                                    .copyWith(
                                        color: Get.isDarkMode
                                            ? null
                                            : const Color(0x6602499B),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10),
                              ),
                              onChanged: (newValue) =>
                                  controllerLmb.onChangedDropdown(newValue),
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              icon: SvgPicture.asset(
                                  'assets/icons/angle-small-down.svg'),
                              items: controllerLmb.listPointPPA
                                  .map<DropdownMenuItem<PointPpa>>(
                                      (PointPpa selectedType) {
                                return DropdownMenuItem<PointPpa>(
                                  value: selectedType,
                                  child: Text(selectedType.nmPoint!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 10)),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const ListLmb(),
                      ],
                    ),
                  ),
                ),
              )),
        ),
        floatingActionButton: Obx(
          () => FloatingActionButton(
            onPressed: controllerLmb.pointIsSelected.value &&
                    controllerLmb.isLoading.value == false
                ? controllerLmb.getLmb
                : null,
            backgroundColor: const Color(0xFFF2994A),
            child: const Icon(Icons.refresh),
          ),
        ));
  }
}
