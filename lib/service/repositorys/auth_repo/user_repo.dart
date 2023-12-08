import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_app/src/utils/app_utils.dart';
import '../../../app_models/user_model.dart';
import '../../../src/constants/api_constants/api_const.dart';

class UserRepository {
  static final UserRepository _singleton = UserRepository._internal();
  UserRepository._internal();
  static UserRepository getInstance() {
    return _singleton;
  }
  Dio dio = Dio();

  Future<dynamic> userLogin({String? emile, String? password}) async {
    try {
      Map<String, dynamic> body = {
        "email": emile,
        "password": password
      };
      Response response = await dio.post(BaseApi.SIGN_IN,
        data: body,
      );
      if(response.statusCode == HttpStatus.ok){
        AppUtils.userModel = UserModel.fromJson(response.data);
        return {"status_code": response.statusCode,"message": response.statusMessage};
      } else{
        return {"status_code": response.statusCode,"message":response.statusMessage};
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode == 422) {
        return {"status_code": e.response!.statusCode,"message":e.response?.data["message"]};
      } else {
        debugPrint('Other error: $e');
      }
    }
  }


}
