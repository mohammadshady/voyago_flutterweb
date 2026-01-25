import 'package:get/get.dart';
import '../../../../core/classes/crud.dart';
import '../../../../core/constant/linkapi.dart';

class UserData{

  Crud curd = Get.find();
  UserData(this.curd);

  getUsers(int page,String? search) async {
    String url = '${AppLink.getUsers}?page=$page';

    if (search != null && search.isNotEmpty) {
      url += '&search=$search';
    }

    var response = await curd.getData(
        url,
      auth: true
    );
    return response.fold((l) => l, (r) => r);

  }

}
