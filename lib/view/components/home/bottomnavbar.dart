import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: Color(0xFF212D3B),
        border: Border(
          bottom: BorderSide(color: Colors.black12),
        ),
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              const Text(
                '2026 c ',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                'rights'.tr,
                style: const TextStyle(color: Colors.grey),
              ),

            ],
          ),
        ],
      ),
    );
  }
}

