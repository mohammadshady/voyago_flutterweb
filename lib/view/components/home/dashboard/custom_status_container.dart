import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomStatusContainer extends StatelessWidget {
  final Color color;
  final String text;
  const CustomStatusContainer({Key? key, required this.color, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color, // or Colors.cyan
        borderRadius: BorderRadius.circular(50), // ⬅ large circular border
      ),
      child:  Text(
        text.tr,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.w900

        ),
      ),
    );
  }
}
