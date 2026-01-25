import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project2/controller/home/home_layout_controller.dart';
import 'package:web_project2/view/components/home/bottomnavbar.dart';
import 'package:web_project2/view/components/home/sidebar/sidebar.dart';
import '../../components/home/topnavbar.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeLayoutController());
    return Scaffold(
      body: Row(
        children: [
          GetBuilder<HomeLayoutController>(
              builder: (controller){
                return const SideBar();
              }
          ),
          Expanded(
            child: Column(
              children: [
                const TopNavbar(),
                Expanded(
                  child: GetBuilder<HomeLayoutController>(
                      builder: (controller){
                        return controller.contents[controller.currentContent];
                      }
                  ),
                ),
                const BottomNavBar(),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
