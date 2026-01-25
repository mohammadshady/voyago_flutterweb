import 'package:get/get.dart';
import '../../controller/home/manage_users_controller.dart';
import '../classes/crud.dart';

class MyBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(Crud());
    Get.lazyPut(() => ManageUsersController(), fenix: true);
  }
}