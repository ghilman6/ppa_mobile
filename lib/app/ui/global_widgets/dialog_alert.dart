import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DialogAlert extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? textButtonYes;
  final String? textButtonNo;

  const DialogAlert({
    Key? key,
    this.title,
    this.subtitle,
    this.textButtonYes,
    this.textButtonNo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.dialogBackgroundColor,
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/icons/alert-waiting.svg', height: 100),
            const SizedBox(height: 16.0),
            Text(
              title ?? "Konfirmasi!",
              style: context.theme.textTheme.subtitle2!.copyWith(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                color: Get.isDarkMode ? null : const Color(0xFF02499B),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              subtitle ?? "Apakah Anda yakin ingin menghapus item ini?",
              textAlign: TextAlign.center,
              style: context.theme.textTheme.subtitle2!.copyWith(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: OutlinedButton(
                    onPressed: () => Get.back(result: false),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Get.isDarkMode ? Colors.grey[800] : null,
                      minimumSize: const Size.fromHeight(45),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(
                      textButtonNo ??"Kembali",
                      style: context.theme.textTheme.subtitle2!.copyWith(
                          color: Get.isDarkMode ? null : Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () => Get.back(result: true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF02499B),
                      minimumSize: const Size.fromHeight(45),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(
                      textButtonYes ?? "Ya",
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
