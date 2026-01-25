import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project2/view/components/home/paginate.dart';
import '../../../../controller/home/manage_citites_controller.dart';
import 'city_table.dart';

class CityPage extends StatelessWidget {
  const CityPage({super.key});

  @override
  Widget build(BuildContext context) {
    ManageCitiesController controller= Get.find();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const CityTable(),
          const SizedBox(height: 12),
          const Divider(
            height: 0.3,
          ),
          const SizedBox(height: 10,),
          PaginationWidget(controller: controller,),
        ],
      ),
    );
  }
}