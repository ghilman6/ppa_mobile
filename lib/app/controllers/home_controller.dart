import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppa_mobile/app/data/services/cache_manager.dart';

import '../data/models/login.dart';
import '../data/provider/repositories/auth_repository.dart';

class HomeController extends GetxController with CacheManager {
  final AuthRepository _authRepository = Get.put(AuthRepository(Get.find()));
  final currentIndex = 0.obs;
  final controllerCarousel = CarouselController().obs;
  final List<String> imgList = [
    'https://ppidapi.damri.co.id/storage/lampiran/akses-informasi-slider_1662696483.jpg',
    'https://ppid.damri.co.id/_nuxt/img/slider.cb50054.jpg',
    'https://ppidapi.damri.co.id/storage/lampiran/maklumat-informasi-slider_1662696545.jpg'
  ].obs;
  void onChance(index) {
    currentIndex.value = index;
  }

  Login getProfile() {
    return Login.fromJson(getLogin());
  }

  void handleClick(String value) {
    switch (value) {
      case 'Logout':
        openDialog();
        break;
      case 'Settings':
        Get.snackbar(
            "Under construction", "Maaf, fitur ini masih dalam pengembangan.");
        break;
    }
  }

  Future<void> logOut() async {
    final response = await _authRepository.logout();
    if (response['status']) {
      removeToken()
          .then((_) => removeLogin())
          .then((_) => Get.offNamed('/login', arguments: 'Berhasil logout.'));
    } else {
      Get.snackbar('Gagal', response['message']);
    }
  }

  void openDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('Konfimasi'),
        content: const Text('Apakah yakin anda ingin logout?'),
        actions: [
          TextButton(
            child: const Text("Batal"),
            onPressed: () => Get.back(),
          ),
          TextButton(
            child: const Text("Ya"),
            onPressed: () {
              logOut();
              Get.delete<HomeController>();
            },
          ),
        ],
      ),
    );
  }
}
