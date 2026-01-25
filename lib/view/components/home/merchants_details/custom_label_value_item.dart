import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLabelValue extends StatelessWidget {
  final String label;
  final String value;
  const CustomLabelValue({Key? key, required this.label, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 120, // fixed width for label
          child: Text(label.tr, style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        const SizedBox(width: 30),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey[200],
            ),
            child: Text(value,style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 16),),
          ),
        ),
      ],
    );
  }
}
