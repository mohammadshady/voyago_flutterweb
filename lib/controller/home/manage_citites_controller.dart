import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project2/controller/home/paginate_controller.dart';
import 'package:web_project2/core/classes/statusrequest.dart';
import 'package:web_project2/data/source/remote/home/city-data.dart';
import 'package:web_project2/view/components/home/city_ui/edit_city_dialog.dart';

import '../../core/functions/handling_data.dart';
import '../../data/model/home/city.dart';
import '../../view/components/home/city_ui/add_city_dialog.dart';

class ManageCitiesController extends PaginationController<CityModel> {


  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController englishNameController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  String? status;
  StatusRequest statusRequest = StatusRequest.none;
  CityData cityData = CityData(Get.find());
  bool isActive = true;

  List<CityModel> cities = [];
  CityModel? originalCity;

  changeActive(val){
    isActive = val;
    update();
  }
  changeStatusDropDown(val){
    status = val;
    update();
  }

  void openAddDialog() {
    _clearForm();
    Get.dialog(const AddCityDialog());
  }

  void openEditDialog(int index) {
    originalCity = cities[index];
    nameController.text = originalCity!.name!;
    englishNameController.text = originalCity!.englishName!;
    isActive = originalCity!.status == 'active' ? true : false;

    Get.dialog( EditCityDialog(index));
  }

  Map<String, dynamic> buildEditData() {
    final Map<String, dynamic> data = {};

    if (nameController.text != originalCity!.name) {
      data['name'] = nameController.text;
    }

    if (englishNameController.text != originalCity!.englishName) {
      data['english_name'] = englishNameController.text;
    }

    final newStatus = isActive ? 'active' : 'inactive';
    if (newStatus != originalCity!.status) {
      data['status'] = newStatus;
    }

    return data;
  }

  void _clearForm() {
    nameController.clear();
    englishNameController.clear();
  }

  @override
  Future<void> fetchPage([int page = 1]) async {
    cities.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await cityData.getCities(page,status,searchController.text);
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status'] == 'success') {
        List cityData = response['data'];
        cities.addAll(cityData.map((e) => CityModel.fromJson(e)));
        final meta = response['meta'];
        currentPage = meta['current_page'];
        lastPage = meta['last_page'];
        perPage = meta['per_page'];
        total = meta['total'];
      }else if(response['status'] == 'failure'){
        total = 0;
      }
    }
    update();
  }

  void addCity() async{
      if (!formKey.currentState!.validate()) {
        return;
      }
      statusRequest = StatusRequest.loading;
      update();
      String status = isActive ? 'active' : 'inactive';
      var response = await cityData.addCity(nameController.text,englishNameController.text,status);
      statusRequest = handlingData(response);
      if(statusRequest == StatusRequest.success){
        if(response['status'] == 'success') {
          Get.back();
          Get.snackbar('Success', 'The City Added Successfully',snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            colorText: Colors.white,);
          fetchPage(currentPage);

        }
      }
      update();

  }

  void editCity() async{
    if (!formKey.currentState!.validate()) {
      return;
    }
    final data = buildEditData();
    if (data.isEmpty) {
      Get.back();
      Get.snackbar(
        'Info',
        'No changes detected',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      return;
    }

    statusRequest = StatusRequest.loading;
    update();
    var response = await cityData.editCity(data , originalCity!.id!);
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status'] == 'success') {
        Get.back();
        Get.snackbar('Success', 'The City Updated Successfully',snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,);
        fetchPage(currentPage);
      }
    }
    update();

  }

  void deleteCity(int id) async{
    var response = await cityData.deleteCity(id);
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status'] == 'success') {
        fetchPage(currentPage);
        Get.snackbar(
          'Deleted',
          'City deleted successfully',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }
    }
    update();

  }

  @override
    void onClose() {
      nameController.dispose();
      englishNameController.dispose();
      searchController.dispose();
      super.onClose();
    }

  @override
  void onInit() {
    fetchPage();
    super.onInit();
  }
}
