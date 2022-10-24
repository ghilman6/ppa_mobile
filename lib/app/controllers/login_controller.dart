import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/login.dart';
import '../data/provider/repositories/auth_repository.dart';
import '../data/services/cache_manager.dart';
import '../ui/global_widgets/onloading_dialog.dart';

class LoginController extends GetxController with CacheManager {
  final isObscure = true.obs;
  final isLoading = false.obs;
  final nikController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthRepository _authRepository = Get.put(AuthRepository(Get.find()));
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  /* @override
  void onInit() {
    super.onInit();
  } */

  @override
  void onReady() {
    Get.snackbar('Info', Get.arguments);
    super.onReady();
  }

  @override
  void onClose() {
    nikController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? validator(String value) {
    if (value.isEmpty) {
      return 'Mohon kolom ini harus diisi.';
    }
    return null;
  }

  Future submit() async {
    if (loginFormKey.currentState!.validate()) {
      isLoading.value = true;
      onLoading();
      final response = await _authRepository.login(
          nikController.text, passwordController.text);
      isLoading.value = false;
      if (Get.isDialogOpen!) Get.back();
      if (response['status']) {
        Login login = Login.fromJson(response['data']);
        //Get.snackbar('Berhasil', response['message']);
        await removeLogin();
        await saveLogin(login);
        await saveToken(login.token);
        Get.offNamed('/');
      } else {
        if (response['message'].runtimeType.toString() == 'String') {
          Get.snackbar('Gagal', response['message']);
        } else {
          response['message']
              .forEach((_, error) => Get.snackbar('Gagal', error));
        }
      }
    }
  }

  void onLoading() {
    Get.dialog(
      const OnLoading(),
      barrierDismissible: false,
    );
  }
}
