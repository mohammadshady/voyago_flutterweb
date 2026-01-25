import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAddButton extends StatelessWidget {
  final void Function()? onPressed;
  const CustomAddButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(end: 40),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(
          'add_new'.tr,
          style: const TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF33C8CE),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        ),
      ),
    );
  }
}
