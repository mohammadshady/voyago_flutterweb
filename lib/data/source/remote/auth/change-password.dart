import 'package:get/get.dart';
import '../../../../core/classes/crud.dart';
import '../../../../core/constant/linkapi.dart';

class ChangePasswordData{

  Crud curd = Get.find();
  ChangePasswordData(this.curd);

  postData(String currentPassword, String newPassword , String newPasswordConfirm) async {
    var response = await curd.postData(
        AppLink.changePassword,
        {
          'current_password' : currentPassword,
          'new_password' : newPassword,
          'new_password_confirmation' : newPasswordConfirm
        },
      auth: true
    );
    return response.fold((l) => l, (r) => r);

  }
}
