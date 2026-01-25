import 'package:flutter/material.dart';
import 'package:web_project2/view/components/home/merchants_details/custom_label_value_item.dart';

class CustomRowItem extends StatelessWidget {
  final String label1;
  final String value1;
  final String label2;
  final String value2;
  const CustomRowItem({Key? key, required this.label1, required this.value1, required this.label2, required this.value2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // First pair
        Expanded(child: CustomLabelValue(label: label1,value: value1,)),
        const SizedBox(width: 20),
        // Second pair
        Expanded(child: CustomLabelValue(label: label2,value: value2,)),
      ],
    );
  }
}
