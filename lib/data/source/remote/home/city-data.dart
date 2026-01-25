import 'package:get/get.dart';
import '../../../../core/classes/crud.dart';
import '../../../../core/constant/linkapi.dart';

class CityData{

  Crud curd = Get.find();
  CityData(this.curd);


  getCities(int page,String? status , String? search) async {
    String url = '${AppLink.getCities}?page=$page';

    if (search != null && search.isNotEmpty) {
      url += '&search=$search';
    }

    if (status != null && status.isNotEmpty) {
      url += '&status=$status';
    }
    var response = await curd.getData(
        url,
      auth: true
    );
    return response.fold((l) => l, (r) => r);

  }

  addCity(String name , String englishName , String status) async {
    var response = await curd.postData(
        AppLink.addCity,
        {
          'name' : name,
          'english_name' : englishName,
          'status' : status,
        },
        auth: true
    );
    return response.fold((l) => l, (r) => r);

  }

  editCity(data,int id) async {
    var response = await curd.putData(
        "${AppLink.editCity}$id",
        data: data,
        auth: true
    );
    return response.fold((l) => l, (r) => r);

  }

  deleteCity(int id) async {
    var response = await curd.deleteData(
        "${AppLink.deleteCity}$id",
        auth: true
    );
    return response.fold((l) => l, (r) => r);

  }


}
