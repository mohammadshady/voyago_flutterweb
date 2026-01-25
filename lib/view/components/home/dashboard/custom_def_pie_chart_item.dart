import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefPieChartItems extends StatelessWidget {
  final String text;
  final Color color;
  const DefPieChartItems({Key? key, required this.text, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 40, height: 14, color: color),
        const SizedBox(width: 6),
        Text(text.tr,style: const TextStyle(fontSize: 15,),),
      ],
    );
  }
}
