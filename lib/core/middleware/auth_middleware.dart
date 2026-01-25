import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../functions/check-token.dart';
import '../services/services.dart';

class AuthMiddleware extends GetMiddleware {
  final MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    final token = myServices.sharedPreferences.getString('token');

    // Not logged in
    if (token == null) {
      return const RouteSettings(name: '/');
    }

    // Token expired
    if (isTokenExpired(token)) {
      myServices.sharedPreferences.clear();
      return const RouteSettings(name: '/');
    }

    // Logged in & valid token
    return null;
  }
}

