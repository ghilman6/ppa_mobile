import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogCustom extends StatelessWidget {
  final String? img;
  final String? title;
  final String? subtitle;
  final String? page;
  final String? pagetitle;
  final String? opsional;
  const DialogCustom(
      {Key? key,
      this.img,
      this.title,
      this.subtitle,
      this.page,
      this.pagetitle,
      this.opsional})
      : super(key: key);

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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(img ?? 'assets/image/dialog-success.png', height: 100),
            const SizedBox(height: 16.0),
            Text(
              title ?? "ABSENSI BERHASIL!",
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                color: Color(0xFF02499B),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              subtitle ??
                  "Absensi Sukses, Silahkan lanjutkan pekerjaan dan Jangan lupa mengisi absensi kembali ketika jam pulang",
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2F2E41),
              ),
            ),
            const SizedBox(height: 24.0),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () => {
                  if (page != null) ...[
                    if (opsional == 'addtask') ...[
                      addTaskDialog()
                    ] else if (opsional == 'notifications') ...[
                      approvalDialog()
                    ] else ...[
                      {Get.offAllNamed(page!)}
                    ]
                  ] else ...[
                    {Get.back()}
                  ],
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF02499B),
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  pagetitle ?? "Kembali Ke Beranda",
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addTaskDialog() async {
    if (Get.isDialogOpen!) {
      Get.back();
    }
    bool isAddtask = await Get.toNamed(page!);
    if (isAddtask) {
      Get.dialog(
        const DialogCustom(
          title: 'BERHASIL!',
          subtitle: 'Data task berhasil ditambahkan',
          pagetitle: 'Tutup',
        ),
        barrierDismissible: false,
      );
    }
  }

  Future<void> approvalDialog() async {
    if (Get.isDialogOpen!) {
      Get.back();
    }
    await Get.toNamed(page!);
  }
}
