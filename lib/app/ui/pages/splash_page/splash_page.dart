import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../global_widgets/double_back_to_close_app.dart';

import '../../../controllers/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView(context);
        } else {
          if (snapshot.hasError) {
            return errorView(snapshot);
          } else {
            return waitingView(context);
          }
        }
      },
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Ketuk kembali lagi untuk keluar'),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/image/dialog-failed.png', height: 100),
                const SizedBox(height: 16.0),
                const Text(
                  "TERJADI KESALAHAN",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF02499B),
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Error: ${snapshot.error}',
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2F2E41),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container waitingView(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      color: Get.isDarkMode ? Colors.grey[900] : Colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Get.isDarkMode
                  ? Image.asset('assets/image/logo-damri-putih.png')
                  : SvgPicture.asset(
                      'assets/image/logo-damri.svg',
                      width: 195,
                      height: 35,
                      // fit: BoxFit.fill,
                    ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.18,
            child: const CircularProgressIndicator(),
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
        ],
      ),
    );
  }
}
