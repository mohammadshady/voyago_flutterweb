import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTitleCard extends StatelessWidget {
  final Color color;
  final String titleName;
  final String titleNumber;
  final IconData icon;
  const CustomTitleCard({Key? key, required this.color, required this.titleName, required this.titleNumber, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Stack(
          children: [
            Positioned(
              left: -25,
                bottom: -40,
                child: Icon( icon, // change to your icon
                  size: 130, // large size
                  color: Colors.white.withOpacity(0.2), // optional soft effect ),,
            ),
            ),
            Directionality(
              textDirection: TextDirection.ltr, // 🔒 force right side always

              child: Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 20.0 ,left: 20 , bottom: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        titleNumber,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        titleName.tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
