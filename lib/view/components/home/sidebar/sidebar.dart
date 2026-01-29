import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project2/controller/home/home_layout_controller.dart';
import 'package:web_project2/core/constant/images.dart';
import 'package:web_project2/view/components/home/sidebar/sidebar_group.dart';
import 'package:web_project2/view/components/home/sidebar/sidebar_item.dart';


class SideBar extends GetView<HomeLayoutController> {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeLayoutController>(
      builder: (controller) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: controller.isOpen ? 250 : 70, // closed width
          color: const Color(0xFF212D3B),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: controller.isOpen
                    ? SizedBox(
                  height: 50,
                  width: 250,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: (){
                          controller.changeContent(0);
                          controller.changeCurrentPrimarySideBar(-1,-1);
                          controller.toggleExpandedSidebar(-1);

                        },
                        child: Image.asset(
                          AppImageAsset.voyago,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.menu, color: Colors.white),
                        onPressed: () => controller.toggleSideBar(),
                      ),
                    ],
                  ),
                )
                    : Center(
                  child: IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () => controller.toggleSideBar(),
                  ),
                ),
              ),
              Expanded(
                child: controller.isOpen
                    ? ListView(
                  key: const ValueKey('open_sidebar'),
                  children: [
                    const SizedBox(height: 10,),
                            SidebarGroup(
                              icon: Icons.person,
                              title: 'users'.tr,
                              index: 1,
                              children: [
                                SidebarItem(
                                    title: 'add_user'.tr,
                                    icon: Icons.add,
                                    selected: true,
                                    color: controller.selectedChildIndex == 0 && controller.currentPrimarySideBar == 1 ? const Color(0xFF3E4B5C) : Colors.transparent,
                                    onTap: () {
                                      controller.manageUsersController.openAddDialog();
                                      //Get.find<ManageUsersController>().openAddDialog();
                                      //controller.openAddDialog();
                                      //controller.changeContent(2);
                                      controller.changeCurrentPrimarySideBar(1, 0); // parent=1, child=0

                                    }
                                ),
                                SidebarItem(
                                    title: 'manage_users'.tr,
                                    icon: Icons.menu,
                                    selected: true,
                                    color: controller.selectedChildIndex == 1 && controller.currentPrimarySideBar == 1 ? const Color(0xFF3E4B5C) : Colors.transparent,

                                    onTap: (){
                                      controller.changeCurrentPrimarySideBar(1, 1); // parent=1, child=0
                                      controller.changeContent(2);
                                      //controller.changeChildItemSideBar(2);
                                    }
                                ),
                              ],
                            ),
                            Divider(
                              height: 1,
                              thickness: 1.3,
                              color: Colors.white.withOpacity(0.1),
                            ),
                            SidebarGroup(
                              icon: Icons.settings_suggest,
                              title: 'merchants'.tr,
                              index: 2,
                              children: [
                              ],
                            ),
                            Divider(
                              height: 1,
                              thickness: 0.5,
                              color: Colors.white.withOpacity(0.1),
                            ),
                            SidebarGroup(
                              icon: Icons.menu_sharp,
                              title: 'orders'.tr,
                              index: 3,
                              children: [
                              ],
                            ),
                            Divider(
                              height: 1,
                              thickness: 0.5,
                              color: Colors.white.withOpacity(0.1),
                            ),
                            SidebarGroup(
                              icon: Icons.settings,
                              title: 'settings'.tr,
                              index: 4,
                              children: [
                              ],
                            ),
                            Divider(
                              height: 1,
                              thickness: 0.5,
                              color: Colors.white.withOpacity(0.1),
                            ),
                            SidebarGroup(
                              icon: Icons.shopping_cart,
                              title: 'delivery_agents'.tr,
                              index: 5,
                              children: [
                              ],
                            ),
                            Divider(
                              height: 1,
                              thickness: 0.5,
                              color: Colors.white.withOpacity(0.1),
                            ),
                            SidebarGroup(
                              icon: Icons.menu_open,
                              title: 'constant'.tr,
                              index: 6,
                              children: [
                                SidebarItem(
                                  title: 'manage_cities'.tr,
                                  icon: Icons.location_city,
                                  selected: true,
                                  color: controller.selectedChildIndex == 0 && controller.currentPrimarySideBar == 6  ? const Color(0xFF3E4B5C) : Colors.transparent,

                                  onTap: () {
                                    controller.changeCurrentPrimarySideBar(6, 0); // parent=1, child=0
                                    controller.changeContent(1);
                                  },
                                ),
                              ],
                            ),
                  ], // your normal SidebarGroups
                )
                    : Column(
                  children: [
                    SidebarGroupCollapsed(
                      index: 1,
                      icon: Icons.person,
                      title: 'users'.tr,
                      children: [
                        SidebarItem(
                          title: 'add_user'.tr,
                          icon: Icons.add,
                          onTap: () {
                            controller.manageUsersController.openAddDialog();
                            controller.changeCurrentPrimarySideBar(1, 0);
                          },
                        ),
                        SidebarItem(
                          title: 'manage_users'.tr,
                          icon: Icons.menu,
                          onTap: () {
                            controller.changeCurrentPrimarySideBar(1, 1);
                            controller.changeContent(2);
                          },
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Divider(
                        height: 1,
                        thickness: 0.5,
                        color: Colors.grey,//.withOpacity(0.1),
                      ),
                    ),
                    SidebarGroupCollapsed(
                      index: 2,
                      icon: Icons.settings,
                      title: 'merchants'.tr,
                      children: [],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Divider(
                        height: 1,
                        thickness: 0.5,
                        color: Colors.grey,//.withOpacity(0.1),
                      ),
                    ),
                    SidebarGroupCollapsed(
                      index: 3,
                      icon: Icons.menu_sharp,
                      title: 'orders'.tr,
                      children: [],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Divider(
                        height: 1,
                        thickness: 0.5,
                        color: Colors.grey,//.withOpacity(0.1),
                      ),
                    ),
                    SidebarGroupCollapsed(
                      index: 4,
                      icon: Icons.settings,
                      title: 'settings'.tr,
                      children: [],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Divider(
                        height: 1,
                        thickness: 0.5,
                        color: Colors.grey,//.withOpacity(0.1),
                      ),
                    ),
                    SidebarGroupCollapsed(
                      index: 5,
                      icon: Icons.shopping_cart,
                      title: 'delivery_agents'.tr,
                      children: [],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Divider(
                        height: 1,
                        thickness: 0.5,
                        color: Colors.grey,//.withOpacity(0.1),
                      ),
                    ),
                    SidebarGroupCollapsed(
                      index: 6,
                      icon: Icons.location_city,
                      title: 'manage_cities'.tr,
                      children: [
                        SidebarItem(
                          title: 'manage_cities'.tr,
                          icon: Icons.location_city,
                          selected: true,
                          color: controller.selectedChildIndex == 0 && controller.currentPrimarySideBar == 6  ? const Color(0xFF3E4B5C) : Colors.transparent,

                          onTap: () {
                            controller.changeCurrentPrimarySideBar(6, 0); // parent=1, child=0
                            controller.changeContent(1);
                          },
                        ),

                      ],
                    ),

                  ],
                ),
              ),

            ],
          ),
        );
      },
    );
  }
}









