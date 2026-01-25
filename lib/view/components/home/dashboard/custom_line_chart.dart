import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLineChart extends StatelessWidget {
  const CustomLineChart({Key? key}) : super(key: key);

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
                const Icon(Icons.analytics_outlined),
                const SizedBox(width: 8),
                Text(
                  'last_7_days_orders'.tr,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 40,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: const Border(

                              ),
                            ),
                          ),
                          const SizedBox(width: 5,),
                          Text('daily_sales'.tr),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: SizedBox(
                          child: LineChart(
                            LineChartData(
                              gridData: FlGridData(
                                show: true,
                                drawVerticalLine: true,
                                drawHorizontalLine: true,
                                horizontalInterval: 0.1,
                                getDrawingHorizontalLine: (_) =>
                                    FlLine(
                                      color: Colors.grey.shade300,
                                      strokeWidth: 1,
                                    ),
                                getDrawingVerticalLine: (_) =>
                                    FlLine(
                                      color: Colors.grey.shade300,
                                      strokeWidth: 1,
                                    ),
                              ),
                              titlesData: FlTitlesData(
                                show: true,
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    interval: 0.1,
                                    reservedSize: 40, // space for left labels
                                    getTitlesWidget: (value, _) => Padding(
                                      padding: const EdgeInsetsDirectional.only(start: 10.0),// EdgeInsets.only(right: 2.0),
                                      child: Text(value.toStringAsFixed(1)),
                                    ),
                                  ),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 30, // extra space at bottom so text isn’t cut
                                    interval: 1,
                                    getTitlesWidget: (value, _) {
                                      final days = ['01-05', '01-06', '01-07', '01-08', '01-09', '01-10', '01-11'];
                                      if (value.toInt() >= 0 && value.toInt() < days.length) {
                                        return Padding(
                                          padding: const EdgeInsets.only(top: 10.0),
                                          child: Text(days[value.toInt()]),
                                        );
                                      }
                                      return const SizedBox.shrink();
                                    },
                                  ),
                                ),
                                topTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false)),
                                rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                              ),
                              //borderData: FlBorderData(show: true),
                              borderData: FlBorderData(
                                show: true,
                                border: Border.all(
                                  color: Colors.grey.shade400, // same as horizontal lines
                                  width: 1,
                                ),
                              ),
                              minY: 0,
                              maxY: 1,
                              lineBarsData: [
                                LineChartBarData(
                                  spots: List.generate(7, (i) => FlSpot(i.toDouble(), 0)),
                                  isCurved: false,
                                  color: Colors.blue,
                                  barWidth: 2,
                                  dotData: FlDotData(show: true),
                                ),
                              ],
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
