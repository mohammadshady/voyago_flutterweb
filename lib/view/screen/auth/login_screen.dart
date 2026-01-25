import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project2/controller/auth/login_conroller.dart';
import 'package:web_project2/core/classes/handling-data-request.dart';
import 'package:web_project2/core/constant/images.dart';
import '../../components/auth/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      body: GetBuilder<LoginController>(builder: (controller){
        return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Row(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 80 , left: 80,top: 50),
                    child: LoginForm(),
                  ),
                ),
                Expanded(
                  child: CarouselSlider(
                    options: CarouselOptions(
                        height: double.infinity,
                        autoPlay: true, // automatically slide
                        autoPlayInterval: const Duration(seconds: 3),
                        enlargeCenterPage: true, // optional, makes current image bigger
                        viewportFraction: 1.0,
                        scrollDirection: Axis.vertical
                    ),
                    items: AppImageAsset.imageList.map((item) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Image.asset(
                            item,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
        );
      },
      ),
    );
  }
}


