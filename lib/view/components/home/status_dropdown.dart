import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project2/controller/home/manage_citites_controller.dart';

class StatusDropdown extends GetView<ManageCitiesController> {
  const StatusDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 42,
      child: DropdownButtonFormField<String>(
        value: controller.status,
        decoration: InputDecoration(
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          border: _border(),
          enabledBorder: _border(),
          focusedBorder: _border(color: Colors.blue),
        ),
        items:  [
          DropdownMenuItem(value: null, child: Text('status'.tr , style: const TextStyle(fontWeight: FontWeight.bold),)),
          DropdownMenuItem(value: 'active', child: Text('active'.tr)),
          DropdownMenuItem(value: 'inactive', child: Text('inactive'.tr)),
        ],
        onChanged: (value) {
          controller.changeStatusDropDown(value);
        },
      ),
    );
  }

  OutlineInputBorder _border({Color color = Colors.grey}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: color.withOpacity(0.4)),
    );
  }
}
