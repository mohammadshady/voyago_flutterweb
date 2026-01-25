import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:web_project2/controller/home/dashboard_controller.dart';
import 'package:web_project2/view/components/home/dashboard/custom_merchants_table.dart';
import 'package:web_project2/view/components/home/dashboard/custom_pie_chart.dart';
import 'package:web_project2/view/components/home/dashboard/custom_title_card.dart';
import 'package:web_project2/view/components/home/dashboard/custom_line_chart.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DashboardController controller = Get.put(DashboardController());
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Focus(
        autofocus: true,
        onKeyEvent: (node, event) {
          const double scrollAmount = 40;
          if (event is KeyDownEvent || event is KeyRepeatEvent) {
            if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
              controller.scrollController.jumpTo(
                (controller.scrollController.offset + scrollAmount)
                    .clamp(
                  0.0,
                  controller.scrollController.position.maxScrollExtent,
                ),
              );
              return KeyEventResult.handled;
            }

            if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
              controller.scrollController.jumpTo(
                (controller.scrollController.offset - scrollAmount)
                    .clamp(
                  0.0,
                  controller.scrollController.position.maxScrollExtent,
                ),
              );
              return KeyEventResult.handled;
            }

            if (event.logicalKey == LogicalKeyboardKey.pageDown) {
              controller.scrollController.jumpTo(
                (controller.scrollController.offset + 300)
                    .clamp(
                  0.0,
                  controller.scrollController.position.maxScrollExtent,
                ),
              );
              return KeyEventResult.handled;
            }

            if (event.logicalKey == LogicalKeyboardKey.pageUp) {
              controller.scrollController.jumpTo(
                (controller.scrollController.offset - 300)
                    .clamp(
                  0.0,
                  controller.scrollController.position.maxScrollExtent,
                ),
              );
              return KeyEventResult.handled;
            }
          }
          return KeyEventResult.ignored;
        },

        child: Scrollbar(
          controller: controller.scrollController,
          thumbVisibility: true,
          child: SingleChildScrollView(
            controller: controller.scrollController,
            physics: const ClampingScrollPhysics(),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'dashboard'.tr,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: CustomTitleCard(
                            icon: Icons.shopping_cart_rounded,
                          color: Color(0xFF578EBE),
                            titleName: 'total_sales',
                            titleNumber: '0',
                        )
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: CustomTitleCard(
                          icon: Icons.groups,
                          color: Color(0xFF8775A7),
                            titleName: 'total_merchants',
                            titleNumber: '31',
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: CustomTitleCard(
                          icon: Icons.check,
                          color: Color(0xFFE35B5A),
                            titleName: 'kyc_requests',
                            titleNumber: '0',
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: CustomTitleCard(
                          icon: Icons.crop_landscape,
                          color: Color(0xFF44B6AE),
                          titleName: 'pending_settlements',
                          titleNumber: '2',
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(
                    height: 450,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CustomLineChart(),
                        ),
                        SizedBox(width: 15,),
                        Expanded(
                          child: CustomPieChart(),
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomMerchantsTable(),
                ]
            ),
          ),
        ),
      ),
    );

  }

}



