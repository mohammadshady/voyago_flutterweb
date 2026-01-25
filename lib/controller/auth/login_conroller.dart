
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/classes/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handling_data.dart';
import '../../core/services/services.dart';
import '../../data/source/remote/auth/login.dart';


class LoginController extends GetxController{

  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  StatusRequest statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  MyServices myServices = Get.find();

  goToForgetPassword() {}

  goToSignUp() {}

  goToHome()async{
    if(formKey.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(
        emailController.text,
        passwordController.text,
      );
      print(response);
      statusRequest = handlingData(response);
      if(statusRequest == StatusRequest.success){
        if(response['status'] == 'success'){
          myServices.sharedPreferences.setInt('id', response['admin']['id']);
          myServices.sharedPreferences.setString('name', response['admin']['english_name']);
          myServices.sharedPreferences.setString('token', response['token']);

          Get.offAllNamed(AppRoutes.homeLayout);

        }else{
          statusRequest = StatusRequest.failure;
          Get.defaultDialog(title: 'error' , middleText: 'Email or Password Not Correct');
        }
      }
      update();
    }
  }




}