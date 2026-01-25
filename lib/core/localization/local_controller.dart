import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/services.dart';


class LocaleController extends GetxController{
  Locale? language;
  MyServices myServices = Get.find();

  changeLang(String langCode){
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString('lang', langCode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString('lang');
    if(sharedPrefLang == 'ar'){
      language = const Locale('ar');
    }else {
      language = const Locale('en');
    }

    super.onInit();
  }

}