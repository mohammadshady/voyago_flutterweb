import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/home/merchants.dart';

class DashboardController extends GetxController{

  final ScrollController scrollController = ScrollController();

  final List<Merchant> merchants = [
    Merchant(merchant: 'ali', englishName: 'Ali Nahhal', active: false, createdDate: '02-12-2025'),
    Merchant(merchant: 'hassan', englishName: 'hassan polsk', active: true, createdDate: '02-12-2025'),
    Merchant(merchant: 'omar', englishName: 'omar trs', active: true, createdDate: '02-12-2025'),
    Merchant(merchant: 'shady', englishName: 'shady rb', active: true, createdDate: '02-12-2025'),
    Merchant(merchant: 'nono', englishName: 'Tulkarm', active: true, createdDate: '03-12-2025'),
  ];

  List orders = [ 7,0,0];
  List status = ['approved' , 'pending_delivery' , 'delivered'];
  List<Color> pieChartColor = [Colors.orangeAccent , Colors.green , Colors.red];

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

}