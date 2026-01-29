import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project2/controller/home/manage_users_controller.dart';
import '../../components/home/custom_add_button.dart';
import '../../components/home/custom_title.dart';
import '../../components/home/search_feild.dart';
import '../../components/home/user_ui/user_page.dart';

class ManageUsersScreen extends StatelessWidget {
  const ManageUsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    ManageUsersController controller = Get.put(ManageUsersController());
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            GetBuilder<ManageUsersController>(
                builder: (controller){
                  return CustomTitle(title: 'manage_users', count: controller.total);
                }
            ),
            Row(
              children: [
                SearchField(controller: controller.searchController,onPressed: (){controller.fetchPage();},),
                const SizedBox(width: 12),
                const Spacer(),
                CustomAddButton(
                  onPressed: (){
                    controller.openAddDialog();
                  },
                ),


              ],
            ),
            const UserPage(),
          ],
        ),
      ),
    );
  }
}