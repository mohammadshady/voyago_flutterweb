import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project2/controller/home/manage_citites_controller.dart';
import 'package:web_project2/view/components/home/custom_add_button.dart';
import 'package:web_project2/view/components/home/custom_title.dart';
import '../../components/home/city_ui/city_page.dart';
import '../../components/home/search_feild.dart';
import '../../components/home/status_dropdown.dart';

class ManageCitiesScreen extends StatelessWidget {
  const ManageCitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ManageCitiesController controller = Get.put(ManageCitiesController());
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            GetBuilder<ManageCitiesController>(
                builder: (controller){
                  return CustomTitle(title: 'manage_cities', count: controller.total);
                }
            ),
            Row(
              children: [
                SearchField(controller: controller.searchController,onPressed: (){controller.fetchPage();},),
                const SizedBox(width: 12),
                const StatusDropdown(),
                const Spacer(),
                CustomAddButton(
                  onPressed: (){
                    controller.openAddDialog();
                  },
                ),

              ],
            ),
            const CityPage(),
          ],
        ),
      ),
    );

  }
}
