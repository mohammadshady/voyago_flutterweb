import 'package:flutter/material.dart';

import 'package:web_project2/core/classes/statusrequest.dart';

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest({Key? key, required this.statusRequest, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     if(statusRequest == StatusRequest.loading){
       return Stack(
         children: [
           widget,
           Positioned.fill(
             child: Container(
               color: Colors.black.withOpacity(0.1),
               child: const Center(
                 child: CircularProgressIndicator(),
               ),
             ),
           ),
         ],
       );
     }else if(statusRequest == StatusRequest.serverFailure){
       return Stack(
         children: [
           //
           widget,
         ],
       );
     }else{
       return widget;
     }
  }
}
