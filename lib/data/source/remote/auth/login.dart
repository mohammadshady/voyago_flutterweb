import 'package:get/get.dart';
import '../../../../core/classes/crud.dart';
import '../../../../core/constant/linkapi.dart';

class LoginData{

  Crud curd = Get.find();
  LoginData(this.curd);

  postData(String email, String password) async {
    var response = await curd.postData(
        AppLink.login,
        {
          'email' : email,
          'password' : password,
        }
    );
    return response.fold((l) => l, (r) => r);

  }
}
