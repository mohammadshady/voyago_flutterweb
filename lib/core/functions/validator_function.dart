
import 'package:get/get.dart';

validator(String val,String type ,int max , int min){

  if(val.isEmpty){
    return "no_empty".tr;
  }

  if(type == 'email'){
    if(!GetUtils.isEmail(val)){
      return 'not valid email'.tr;
    }
  }

  if(val.length > max){
    return '${'can not be larger than'.tr} $max';
  }
  if(val.length < min){
    return '${'can not be less than'.tr} $min';

  }



}