import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project2/controller/home/dashboard_controller.dart';
import 'package:web_project2/view/components/home/dashboard/custom_def_pie_chart_item.dart';

class CustomPieChart extends GetView<DashboardController> {
  const CustomPieChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                const Icon(Icons.merge_type),
                const SizedBox(width: 8),
                Text(
                  'orders_type'.tr,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Divider(height: 1),
          ), // Divider right after row
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Colors.grey,
                    width: 0.3,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Wrap(
                        spacing: 12,           // المسافة بين العناصر أفقياً
                        runSpacing: 6,         // المسافة بين الصفوف عمودياً
                        alignment: WrapAlignment.center,      // محاذاة العناصر في كل صف أفقي
                        runAlignment: WrapAlignment.center,   // محاذاة الصفوف الرأسية (مثلاً الصف الثاني في الوسط)
                        children: List.generate(controller.status.length, (i) {
                          final status = controller.status[i];
                          final color = controller.pieChartColor[i % controller.pieChartColor.length]; // لون ثابت حسب index
                          return DefPieChartItems(
                            text: status,
                            color: color,
                          );
                        }),
                      ),

                      const SizedBox(height: 20),
                      Expanded(
                        child: SizedBox(
                          child: PieChart(
                            PieChartData(
                              centerSpaceRadius: 50,
                              sections: List.generate(controller.orders.length, (i) {
                                final color = controller.pieChartColor[i % controller.pieChartColor.length];
                                final value = controller.orders[i].toDouble(); // 🟢 هنا القيمة الفعلية
                                return PieChartSectionData(
                                  value: value,
                                  color: color,
                                  title: '' ,//value.toInt().toString(),
                                  radius: 60,
                                  titleStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                );
                              }),
                            ),
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
