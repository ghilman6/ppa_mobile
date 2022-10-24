import 'package:flutter/material.dart';

class OnLoading extends StatelessWidget {
  const OnLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Mengirim Data'),
      content: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          CircularProgressIndicator(),
          Text('Mohon tunggu...'),
        ],
      ),
    );
  }
}
