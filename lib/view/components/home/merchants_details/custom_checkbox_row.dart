import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCheckBoxRow extends StatelessWidget {
  final String title;
  final bool value;
  final Color color;
  const CustomCheckBoxRow({Key? key, required this.title, required this.value, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Checkbox(value: value, onChanged: null),
        Text(title.tr ,style:  TextStyle(fontWeight: FontWeight.bold,color: color),),
      ],
    );
  }
}
