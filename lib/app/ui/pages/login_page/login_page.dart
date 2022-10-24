import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controllers/login_controller.dart';
import '../../global_widgets/double_back_to_close_app.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Ketuk kembali lagi untuk keluar'),
        ),
        child: Container(
          color: context.theme.cardColor,
          height: size.height,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                width: size.width,
                child: Image.asset(
                  'assets/image/background.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                width: size.width,
                child: SvgPicture.asset(
                  'assets/image/background3.svg',
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                width: size.width,
                child: SvgPicture.asset(
                  'assets/image/background2.svg',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: size.height,
                width: size.width,
                child: Column(
                  children: [
                    const Expanded(flex: 2, child: SizedBox()),
                    Expanded(
                      flex: 7,
                      child: Column(
                        children: [
                          Container(
                            // height: size.height,
                            decoration: BoxDecoration(
                                color: context.theme.cardColor,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Get.isDarkMode
                                      ? Image.asset(
                                          'assets/image/logo-damri-putih.png')
                                      : SvgPicture.asset(
                                          'assets/image/logo-damri.svg',
                                          // width: 120,
                                          height: 30,
                                          // fit: BoxFit.fill,
                                        ),
                                ),
                                Form(
                                  key: controller.loginFormKey,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24.0),
                                    child: Column(children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 8.0),
                                            child: Text(
                                              'Username',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          TextFormField(
                                            controller:
                                                controller.nikController,
                                            validator: (value) =>
                                                controller.validator(value!),
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              hintText: 'Enter your Username',
                                              hintStyle: TextStyle(
                                                  color: Get.isDarkMode
                                                      ? const Color(0xFFB3C5EF)
                                                      : const Color(0xFF02499B),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12),
                                              prefixIcon: Align(
                                                widthFactor: 2.0,
                                                heightFactor: 1.0,
                                                child: SvgPicture.asset(
                                                  'assets/icons/nik.svg',
                                                  color: Get.isDarkMode
                                                      ? const Color(0xFFB3C5EF)
                                                      : const Color(0xFF02499B),
                                                ),
                                              ),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 6),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 8.0),
                                            child: Text(
                                              'Password',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          Obx(
                                            () => TextFormField(
                                              controller:
                                                  controller.passwordController,
                                              validator: (value) =>
                                                  controller.validator(value!),
                                              keyboardType: TextInputType.text,
                                              obscureText:
                                                  controller.isObscure.value,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                hintText: 'Enter your Password',
                                                hintStyle: TextStyle(
                                                    color: Get.isDarkMode
                                                        ? const Color(
                                                            0xFFB3C5EF)
                                                        : const Color(
                                                            0xFF02499B),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12),
                                                prefixIcon: Align(
                                                  widthFactor: 2.0,
                                                  heightFactor: 1.0,
                                                  child: SvgPicture.asset(
                                                    'assets/icons/lock.svg',
                                                    color: Get.isDarkMode
                                                        ? const Color(
                                                            0xFFB3C5EF)
                                                        : const Color(
                                                            0xFF02499B),
                                                  ),
                                                ),
                                                suffixIcon: InkWell(
                                                  onTap: () {
                                                    controller.isObscure.value =
                                                        !controller
                                                            .isObscure.value;
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12.0),
                                                    child: SvgPicture.asset(
                                                      controller.isObscure.value
                                                          ? 'assets/icons/look-pass.svg'
                                                          : 'assets/icons/unlook-pass.svg',
                                                      color: Get.isDarkMode
                                                          ? const Color(
                                                              0xFFB3C5EF)
                                                          : const Color(
                                                              0xFF02499B),
                                                    ),
                                                  ),
                                                ),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        height: 50,
                                        child: Obx(
                                          () => ElevatedButton(
                                            onPressed:
                                                controller.isLoading.value
                                                    ? null
                                                    : () {
                                                        controller.submit();
                                                      },
                                            child: const Text(
                                              "Login",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
