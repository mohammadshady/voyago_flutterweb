import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/home/home_layout_controller.dart';

class SidebarItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool selected;
  final Color? color;
  final VoidCallback onTap;

  const SidebarItem({
    super.key,
    required this.title,
    required this.icon,
    this.selected = false,
    this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 0),
            child: Container(
              color: color ?? Colors.transparent,
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(icon, color: Colors.grey[400]),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(title,
                        style:  TextStyle(color: Colors.grey[400])),
                  ),
                ],
              ),

            ),
          ),
        ),
      ],
    );
  }
}
