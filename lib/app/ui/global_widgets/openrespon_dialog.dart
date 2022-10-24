import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OpenDialogResponse extends StatelessWidget {
  final String? message;
  const OpenDialogResponse({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Peringatan'),
      content: Text(message ?? 'Tidak ada message'),
      actions: [
        TextButton(child: const Text("Tutup"), onPressed: () => Get.back()),
      ],
    );
  }
}
