
import 'dart:convert';


import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:web_project2/core/classes/statusrequest.dart';

import '../services/services.dart';


class Crud{

  MyServices myServices = Get.find();



  Future<Either<StatusRequest,Map>> postData(String linkUrl,data , {auth=false}) async {

    try{
        var response = await http.post(
          Uri.parse(linkUrl),
            headers: {
            'Content-Type': 'application/json' ,
              'Accept' : 'application/json',
              if (auth)
                'Authorization': 'Bearer ${myServices.sharedPreferences.getString('token')}',
            },
            body: jsonEncode(data), // <-- encode data to JSON!
        );
        if(response.statusCode == 200 || response.statusCode == 201){
          var responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else if (response.statusCode == 401) {
          // Wrong credentials
          var responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else{
          return const Left(StatusRequest.serverFailure);
        }
    }catch(_){
      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<Either<StatusRequest, Map>> getData(String linkUrl , {auth = false}) async {
    try {

      var response = await http.get(
        Uri.parse(linkUrl),
        headers: {
          'Content-Type': 'application/json' ,
          'Accept' : 'application/json',
          if (auth)
            'Authorization': 'Bearer ${myServices.sharedPreferences.getString('token')}',
        },

      );

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        return Right(responseBody);
      } else if (response.statusCode == 401) {
        var responseBody = jsonDecode(response.body);
        return Right(responseBody); // handle unauthorized
      } else {
        return const Left(StatusRequest.serverFailure);
      }
    } catch (e) {
      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<Either<StatusRequest, Map>> putData(String linkUrl, { Map<String, dynamic>? data, bool auth = false,}) async {
    try {
      var response = await http.put(
        Uri.parse(linkUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          if (auth)
            'Authorization':
            'Bearer ${myServices.sharedPreferences.getString('token')}',
        },
        body: data != null ? jsonEncode(data) : null,
      );


      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        return Right(jsonDecode(response.body));
      } else {
        return const Left(StatusRequest.serverFailure);
      }
    } catch (e) {
      print(e.toString());
      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<Either<StatusRequest, Map>> deleteData(
      String linkUrl, {
        bool auth = false,
      }) async {
    try {
      var response = await http.delete(
        Uri.parse(linkUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          if (auth)
            'Authorization':
            'Bearer ${myServices.sharedPreferences.getString('token')}',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        return response.body.isNotEmpty
            ? Right(jsonDecode(response.body))
            : Right({});
      } else if (response.statusCode == 401) {
        return Right(jsonDecode(response.body));
      } else {
        return const Left(StatusRequest.serverFailure);
      }
    } catch (e) {
      return const Left(StatusRequest.serverFailure);
    }
  }


}





