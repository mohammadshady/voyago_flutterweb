import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project2/core/classes/handling-data-view.dart';

import '../../../../controller/home/manage_citites_controller.dart';

class CityTable extends StatelessWidget {
  const CityTable({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ManageCitiesController());
    return GetBuilder<ManageCitiesController>(builder: (controller){
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
                        DataColumn(label: Container(width: 400,child: Text('name'.tr, style: TextStyle(fontWeight: FontWeight.bold))) ,),
                        DataColumn(label: Container(width: 200,child: Text('english_name'.tr, style: TextStyle(fontWeight: FontWeight.bold)))),
                        DataColumn(label: Text('active'.tr, style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('created_date'.tr, style: TextStyle(fontWeight: FontWeight.bold))),
                        const DataColumn(label: SizedBox()), // empty for options
                      ],
                      rows: controller.cities.asMap().entries.map((entry) {
                        int index = entry.key;
                        final city = entry.value;
                        Color rowColor =
                        index % 2 == 1 ? Colors.white : Colors.grey[200]!;

                        return DataRow(
                          color: MaterialStateProperty.resolveWith<Color?>(
                                  (states) => rowColor),
                          cells: [
                            DataCell(Container(width: 150, child: Text(city.name!))),
                            DataCell(Text(city.englishName!)),
                            DataCell(
                              Checkbox(
                                value: city.status == 'active' ? true : false,
                                onChanged: (_) {
                                  controller.changeActive(index);
                                },
                              ),
                            ),
                            DataCell(Text(city.createdAt ?? '-')),
                            DataCell(
                              Row(
                                children: [
                                  const Spacer(),
                                  PopupMenuButton<String>(
                                    padding: EdgeInsets.zero,
                                    offset: const Offset(0, 35),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    onSelected: (value) {
                                      if (value == 'edit') {
                                       controller.openEditDialog(index);
                                      }
                                      if (value == 'delete') {
                                        controller.deleteCity(city.id!);
                                      }
                                    },
                                    itemBuilder: (context) => [
                                      PopupMenuItem(
                                        value: 'edit',
                                        height: 30,
                                        child: SizedBox(
                                          width: 180,
                                          child: Row(
                                            children: [
                                              Icon(Icons.edit,
                                                  color: Colors.grey[600],
                                                  size: 18),
                                              const SizedBox(width: 8),
                                              Expanded(
                                                  child: Text(
                                                    'Edit',
                                                    style: TextStyle(
                                                        color: Colors.grey[600],
                                                        fontSize: 14),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                      PopupMenuItem(
                                        value: 'delete',
                                        height: 30,
                                        child: SizedBox(
                                          width: 180,
                                          child: Row(
                                            children: [
                                              Icon(Icons.delete_outline,
                                                  color: Colors.grey[600],
                                                  size: 18),
                                              const SizedBox(width: 8),
                                              Expanded(
                                                  child: Text(
                                                    'Delete',
                                                    style: TextStyle(
                                                        color: Colors.grey[600],
                                                        fontSize: 14),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                    child: Container(
                                      height: 35,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF33C8CE),
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Colors.grey.shade300),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Icon(Icons.settings,
                                              size: 18, color: Colors.white),
                                          SizedBox(width: 8),
                                          Text(
                                            'Options',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
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


