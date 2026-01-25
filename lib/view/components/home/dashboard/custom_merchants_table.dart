import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project2/controller/home/home_layout_controller.dart';
import 'package:web_project2/controller/home/dashboard_controller.dart';
import 'package:web_project2/view/components/home/dashboard/custom_status_container.dart';

class CustomMerchantsTable extends GetView<DashboardController> {
  const CustomMerchantsTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeLayoutController homeLayoutController = Get.find();
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Colors.grey,
          width: 0.1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                const Icon(Icons.analytics_outlined),
                const SizedBox(width: 8),
                Text(
                  'latest_merchants'.tr,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Divider(height: 1),
          ),
          const SizedBox(height: 10,),// Divider right after row
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade300, // نفس لون خطوط الجدول
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(0), // بدون تدوير
              ),
              child: DataTable(
                horizontalMargin: 10,
                columnSpacing: 20,
                columns:  [
                  DataColumn(label: SizedBox(width: 300,child: Text('merchant'.tr, style: const TextStyle(fontWeight: FontWeight.bold))) ,),
                  DataColumn(label: SizedBox(width: 200,child: Text('english_name'.tr, style: const TextStyle(fontWeight: FontWeight.bold)))),
                  DataColumn(label: Text('status'.tr, style: const TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('created_date'.tr, style: const TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('options'.tr, style: const TextStyle(fontWeight: FontWeight.bold))),
                ],
                rows: controller.merchants.asMap().entries.map((entry) {
                  int index = entry.key;
                  final merchant = entry.value;
                  //int realIndex = controller.start + indexInVisible;
                  Color rowColor = index % 2 == 1
                      ? Colors.white
                      : Colors.grey[200]!; // light gray
                  return DataRow(
                    color: MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) => rowColor),
                    cells: [
                      DataCell(SizedBox(width: 150, child: Text(merchant.merchant))), // wider Name column
                      DataCell(Text(merchant.englishName)),
                      DataCell(
                          merchant.active  ? const CustomStatusContainer(color: Color(0xFF36C6D3), text: 'active') :  const CustomStatusContainer(color: Colors.red, text: 'inactive')
                      ),
                      DataCell(Text(merchant.createdDate)),
                      DataCell(
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                homeLayoutController.changeContent(3);
                              },
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(const Size(80, 35)), // ⬅ bigger height
                                padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(horizontal: 10),
                                ),
                                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                      (states) {
                                    if (states.contains(MaterialState.hovered)) {
                                      return Colors.blue; // hover background
                                    }
                                    return Colors.transparent; // normal: no background
                                  },
                                ),
                                foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                      (states) {
                                    if (states.contains(MaterialState.hovered)) {
                                      return Colors.white; // hover text
                                    }
                                    return Colors.blue; // normal text
                                  },
                                ),
                                side: MaterialStateProperty.all(
                                  const BorderSide(color: Colors.blue),
                                ),

                              ),
                              child: Text(
                                'details'.tr,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
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
          ),
        ],
      ),
    );
  }
}
