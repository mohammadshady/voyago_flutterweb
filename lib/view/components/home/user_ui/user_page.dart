import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project2/controller/home/manage_users_controller.dart';
import 'package:web_project2/view/components/home/paginate.dart';
import 'package:web_project2/view/components/home/user_ui/user_table.dart';

import '../../../../core/classes/statusrequest.dart';


class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManageUsersController>(
        builder: (controller){
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const UserTable(),
                if(controller.users.isNotEmpty)
                  const SizedBox(height: 12),
                const Divider(
                  height: 0.3,
                ),
                if(controller.users.isEmpty && controller.statusRequest != StatusRequest.loading)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
                    child: Text('No Data.'),
                  ),
                const SizedBox(height: 10,),
                if(controller.users.isNotEmpty)
                  PaginationWidget(controller: controller,),
              ],
            ),
          );
        }
    );
  }
}