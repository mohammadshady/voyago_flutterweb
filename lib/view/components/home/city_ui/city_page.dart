import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project2/core/classes/statusrequest.dart';
import 'package:web_project2/view/components/home/paginate.dart';
import '../../../../controller/home/manage_citites_controller.dart';
import 'city_table.dart';

class CityPage extends StatelessWidget {
  const CityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManageCitiesController>(
        builder: (controller){
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const CityTable(),
                if(controller.cities.isNotEmpty)
                  const SizedBox(height: 12),
                const Divider(
                  height: 0.3,
                ),
                if(controller.cities.isEmpty && controller.statusRequest != StatusRequest.loading)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
                    child: Text('No Data.'),
                  ),
                const SizedBox(height: 10,),
                if(controller.cities.isNotEmpty)
                  PaginationWidget(controller: controller,),
              ],
            ),
          );
        });
  }
}