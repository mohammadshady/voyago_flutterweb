import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project2/controller/home/manage_users_controller.dart';
import 'package:web_project2/core/classes/handling-data-view.dart';

class UserTable extends StatelessWidget {
  const UserTable({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ManageUsersController());
    return GetBuilder<ManageUsersController>(
        builder: (controller){
          return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: LayoutBuilder(
                  builder: (context,constraints){
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minWidth: constraints.maxWidth),

                        child: DataTable(
                          columnSpacing: 20,
                          columns:  [
                            DataColumn(label: Container(width: 400,child: Text('full_name'.tr, style: const TextStyle(fontWeight: FontWeight.bold))) ,),
                            DataColumn(label: Container(width: 200,child: Text('email'.tr, style: const TextStyle(fontWeight: FontWeight.bold)))),
                            DataColumn(label: Container(width: 200 , child: Text('phone_number'.tr, style: const TextStyle(fontWeight: FontWeight.bold)))),
                            DataColumn(label: Text('active'.tr, style: const TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('created_date'.tr, style: const TextStyle(fontWeight: FontWeight.bold))),
                            const DataColumn(label: SizedBox()), // empty for options
                          ],
                          rows: controller.users.asMap().entries.map((entry){
                            int index = entry.key; // index in visibleItems
                            final user = entry.value;

                            // calculate real index in full list
                            //int realIndex = controller.start + indexInVisible;
                            Color rowColor = index % 2 == 1
                                ? Colors.white
                                : Colors.grey[200]!; // light gray
                            return DataRow(
                              color: MaterialStateProperty.resolveWith<Color?>(
                                      (Set<MaterialState> states) => rowColor),
                              cells: [
                                DataCell(Container(width: 150, child: Text(user.englishName!))), // wider Name column
                                DataCell(Text(user.email!)),
                                DataCell(Text(user.mobile!)),
                                DataCell(Checkbox(
                                  value: user.status == 'active' ? true : false,
                                  onChanged: (_) {
                                    controller.changeActive(index);
                                  },
                                )),
                                DataCell(Text(user.createdAt ?? '-')),
                                DataCell(
                                  Row(
                                    children: [
                                      const Spacer(),
                                      PopupMenuButton<String>(
                                        padding: EdgeInsets.zero, // ✅ remove internal padding
                                        offset: const Offset(0, 35), // ⬅ match button height (no gap)
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        onSelected: (value) {
                                          if (value == 'edit_user') {
                                            controller.openEditDialog(index);
                                          }
                                          if(value == 'reset_password'){
                                            controller.openResetPasswordDialog();
                                          }
                                        },
                                        itemBuilder: (context) => [
                                          PopupMenuItem(
                                            value: 'user_permission',
                                            height: 30,
                                            padding: const EdgeInsets.symmetric(horizontal: 15), // ✅ remove item padding
                                            child: SizedBox(
                                              width: 180,
                                              child: Row(
                                                children: [
                                                  Icon(Icons.lock, color: Colors.grey[600], size: 18),
                                                  const SizedBox(width: 8),
                                                  Expanded(
                                                    child: Text(
                                                      'user_permission'.tr,
                                                      style: TextStyle(color: Colors.grey[600], fontSize: 16),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          PopupMenuItem(
                                            value: 'reset_password',
                                            height: 30,
                                            padding: const EdgeInsets.symmetric(horizontal: 15), // ✅ remove item padding
                                            child: SizedBox(
                                              width: 180,
                                              child: Row(
                                                children: [
                                                  Icon(Icons.key, color: Colors.grey[600], size: 18),
                                                  const SizedBox(width: 8),
                                                  Expanded(
                                                    child: Text(
                                                      'reset_password'.tr,
                                                      style: TextStyle(color: Colors.grey[600], fontSize: 16),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),

                                          PopupMenuItem(
                                            value: 'edit_user',
                                            height: 30,
                                            padding: const EdgeInsets.symmetric(horizontal: 15), // ✅ remove item padding
                                            child: SizedBox(
                                              width: 180,
                                              child: Row(
                                                children: [
                                                  Icon(Icons.edit, color: Colors.grey[600], size: 18),
                                                  const SizedBox(width: 8),
                                                  Expanded(
                                                    child: Text(
                                                      'edit_user'.tr,
                                                      style: TextStyle(color: Colors.grey[600], fontSize: 16),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          PopupMenuItem(
                                            value: 'delete',
                                            height: 30,
                                            padding: const EdgeInsets.symmetric(horizontal: 15), // ✅ remove item padding
                                            child: SizedBox(
                                              width: 180,
                                              child: Row(
                                                children: [
                                                  Icon(Icons.delete_outline, color: Colors.grey[600], size: 18),
                                                  const SizedBox(width: 8),
                                                  Expanded(
                                                    child: Text(
                                                      'delete'.tr,
                                                      style: TextStyle(color: Colors.grey[600], fontSize: 16),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                        child: Container(
                                          height: 30,
                                          padding: const EdgeInsets.symmetric(horizontal: 12),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF33C8CE),
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: Colors.grey.shade300),
                                          ),
                                          child:  Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Icon(Icons.settings, size: 18, color: Colors.white),
                                              const SizedBox(width: 8),
                                              Text(
                                                'options'.tr,
                                                style: const TextStyle(fontSize: 14,color: Colors.white, fontWeight: FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  }
              ),
          );
        });
  }
}
