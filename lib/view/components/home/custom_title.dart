import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final int count;
  const CustomTitle({Key? key, required this.title, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Text(title.tr, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text('(${'total_count'.tr}:$count)', style: TextStyle(fontSize: 17 , color: Colors.grey[700])),
        ],
      ),
    );
  }
}
