import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project2/routes.dart';
import 'core/bindings/my_bindings.dart';
import 'core/localization/local_controller.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: MyTranslation(),
        locale: controller.language,
        title: 'Admin Panel',
        getPages: routes,
        initialBinding: MyBindings(),
    );
  }
}
