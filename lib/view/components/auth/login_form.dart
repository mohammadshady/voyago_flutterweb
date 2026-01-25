import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/login_conroller.dart';
import '../../../core/functions/validator_function.dart';
import '../../../core/localization/local_controller.dart';
import '../../../core/services/services.dart';

class LoginForm extends GetView<LoginController> {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    String? currentLang = myServices.sharedPreferences.getString('lang');
    LocaleController localeController = Get.find();

    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 400,
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff3B82F6),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                ),
                onPressed: () {
                  if(currentLang == 'ar') {
                    localeController.changeLang('en');
                  } else {
                    localeController.changeLang('ar');
                  }
                },
                child:  Text('lang'.tr),
              ),
            ],
          ),
          const SizedBox(height: 80),
          Text(
            'member_login'.tr,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'pleaseEUP'.tr,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    hintText: 'email'.tr,
                    border: const UnderlineInputBorder(),
                  ),
                  validator: (val){
                    return validator(val!, 'email', 100, 11);
                  },
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextFormField(
                  controller: controller.passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'password'.tr,
                    border: const UnderlineInputBorder(),
                  ),
                  validator: (val){
                    return validator(val!, 'password', 100, 6);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Checkbox(value: false, onChanged: (_) {}),
              Text('remember_me'.tr),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff3B82F6),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                ),
                onPressed: () {
                  controller.goToHome();
                },
                child: Text('login'.tr),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('no_account'.tr),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'register_page'.tr,
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        decorationThickness: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero, // <-- removes padding here too
                  minimumSize: const Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  '${'forget_password'.tr}?',
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                    decorationThickness: 1.5,
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
