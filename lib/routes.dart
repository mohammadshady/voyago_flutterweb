
import 'package:get/get.dart';
import 'package:web_project2/view/screen/auth/login_screen.dart';
import 'package:web_project2/view/screen/home/home_layout_screen.dart';

import 'core/constant/routes.dart';
import 'core/middleware/auth_middleware.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: '/', page: ()=> const LoginScreen(),),

  ///home
  GetPage(name: AppRoutes.homeLayout, page: ()=> const HomeLayoutScreen(),
    middlewares: [AuthMiddleware()],

  ),

];