import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project2/data/source/remote/auth/change-password.dart';
import 'package:web_project2/view/screen/home/manage_cities_screen.dart';
import 'package:web_project2/view/screen/home/manage_users_screen.dart';
import 'package:web_project2/view/screen/home/dashboard_screen.dart';
import '../../core/classes/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handling_data.dart';
import '../../core/services/services.dart';
import '../../view/screen/home/merchant_details_screen.dart';
import 'manage_users_controller.dart';

class HomeLayoutController extends GetxController {

  ManageUsersController manageUsersController = Get.find<ManageUsersController>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  StatusRequest statusRequest = StatusRequest.none;
  ChangePasswordData changePasswordData = ChangePasswordData(Get.find());

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newPasswordConfirmController = TextEditingController();
  MyServices myServices = Get.find();

  String name = '';



  var isOpen = true;

  int currentPrimarySideBar = 0; // selected primary item
  int expandedSidebarIndex = -1; // which primary item is expanded
  int selectedChildIndex = -1; // which child is selected (-1 = none)

  int currentContent = 0;

  List<Widget> contents = [
    const DashboardScreen(),
    const ManageCitiesScreen(),
    const ManageUsersScreen(),
    const MerchantDetailsScreen(),

  ];

  void toggleSideBar() {
    isOpen = !isOpen;
    update();
  }

  void changeContent(int index) {
    currentContent = index;
    update();
  }

  void changeCurrentPrimarySideBar(int index, [int childIndex = -1]) {
    currentPrimarySideBar = index;
    selectedChildIndex = childIndex;
    update();
  }

  void toggleExpandedSidebar(int index) {
    if (expandedSidebarIndex == index) {
      expandedSidebarIndex = -1; // collapse if already expanded
    } else {
      expandedSidebarIndex = index; // expand this item
    }
    update();
  }

  changePassword()async{
    if(formKey.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await changePasswordData.postData(
        currentPasswordController.text,
        newPasswordController.text,
        newPasswordConfirmController.text,
      );
      statusRequest = handlingData(response);
      if(statusRequest == StatusRequest.success){
        if(response['status'] == 'success') {
          myServices.sharedPreferences.clear();
          Get.offAllNamed(AppRoutes.login);
        }else if(response['status'] == 'failure'){
          Get.defaultDialog(title: 'Error' , middleText: 'Current password is incorrect');
        }else{
          Get.defaultDialog(title: 'Error' , middleText: 'The new password field confirmation does not match');
        }
      }
      update();
    }
  }
  logOut(){
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    name = myServices.sharedPreferences.getString('name')!;
    super.onInit();
  }


}
