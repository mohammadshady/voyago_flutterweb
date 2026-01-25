import 'package:get/get.dart';
import '../../../../core/classes/crud.dart';
import '../../../../core/constant/linkapi.dart';

class LogOutData{

  Crud curd = Get.find();
  LogOutData(this.curd);

  postData() async {
    var response = await curd.postData(
        AppLink.logout, {} , auth: true

    );
    return response.fold((l) => l, (r) => r);

  }
}
