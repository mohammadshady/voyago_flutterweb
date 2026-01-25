import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project2/controller/home/home_layout_controller.dart';
import 'package:web_project2/core/localization/local_controller.dart';
import 'package:web_project2/view/components/home/change_password_dialog.dart';

import '../../../core/services/services.dart';

class TopNavbar extends GetView<LocaleController> {
  const TopNavbar( {super.key});

  @override
  Widget build(BuildContext context) {
    HomeLayoutController homeLayoutController = Get.find();
    MyServices myServices = Get.find();
    String? currentLang = myServices.sharedPreferences.getString('lang');
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: Color(0xFF212D3B),
        border: Border(
          bottom: BorderSide(color: Colors.black12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          PopupMenuButton<String>(
            offset: const Offset(0, 50),
            onSelected: (value) {
              if(value == 'lang'){
                if(currentLang == 'ar') {
                  controller.changeLang('en');
                }else{
                  controller.changeLang('ar');
                }
              }
              if(value == 'signout'){
                homeLayoutController.logOut();
              }
              if(value == 'password'){
                Get.dialog(const ChangePasswordDialog());
              }
              },
            itemBuilder: (context) => [
              _menuItem(
                  value: 'lang',
                  icon: Icons.language,
                  text: currentLang == 'ar' ? 'English' : 'عربي',
              ),
              _menuItem(
                  value: 'dark',
                  icon: Icons.dark_mode,
                  text: 'Dark Mode',
              ),
              _menuItem(
                  value: 'password',
                  icon: Icons.person_outline,
                  text: 'change_password'.tr,
              ),
              _menuItem(
                value: 'signout',
                icon: Icons.logout,
                text: 'sign_out'.tr,
              ),
          ],
            child:  Row(
              children: [
                const CircleAvatar(radius: 16),
                const SizedBox(width: 8),
                Text(homeLayoutController.name, style: const TextStyle(color: Colors.white)),
                const Icon(Icons.expand_more, color: Colors.white),
        ],
      ),
          )
        ],
      ),
    );
  }
}

PopupMenuItem<String> _menuItem({
  required String value,
  required IconData icon,
  required String text,
}) {
  return PopupMenuItem<String>(
    value: value,
    child: Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[700]),
        const SizedBox(width: 12),
        Text(text),
      ],
    ),
  );
}

