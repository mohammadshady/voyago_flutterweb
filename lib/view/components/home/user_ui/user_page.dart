import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project2/controller/home/manage_users_controller.dart';
import 'package:web_project2/view/components/home/paginate.dart';
import 'package:web_project2/view/components/home/user_ui/user_table.dart';


class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    ManageUsersController controller= Get.find();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const UserTable(),
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