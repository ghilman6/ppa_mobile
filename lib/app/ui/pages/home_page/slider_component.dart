import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';
import '../../utils/constants/colors.dart';

class SliderHome extends GetView<HomeController> {
  const SliderHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider.builder(
            options: CarouselOptions(
              height: 150,
              viewportFraction: 0.9,
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) => controller.onChance(index),
            ),
            itemCount: controller.imgList.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(controller.imgList[itemIndex],
                    fit: BoxFit.fill, width: 1000.0),
              );
            }),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: controller.imgList.asMap().entries.map((entry) {
              return Container(
                  width: 7.0,
                  height: 7.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Get.isDarkMode ? Colors.white : PRIMARY_COLOR)
                          .withOpacity(
                              controller.currentIndex.value == entry.key
                                  ? 0.9
                                  : 0.4)));
            }).toList(),
          ),
        ),
      ],
    );
  }
}
