import 'package:flutter/material.dart';
import 'package:web_project2/core/classes/statusrequest.dart';

import '../constant/images.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView({Key? key, required this.statusRequest,required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(statusRequest == StatusRequest.loading){
      return  const Center(child:CircularProgressIndicator());
    }else if(statusRequest == StatusRequest.failure){
       return  const SizedBox();
    }else{
      return widget;
    }
  }
}

