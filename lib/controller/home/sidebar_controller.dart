import 'package:get/get.dart';

class SidebarController extends GetxController {
  var isOpen = true;

  void toggle() {
    isOpen = !isOpen;
    update();
  }
}
